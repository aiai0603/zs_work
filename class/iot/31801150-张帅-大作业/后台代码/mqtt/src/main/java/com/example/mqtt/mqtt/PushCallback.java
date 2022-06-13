package com.example.mqtt.mqtt;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.example.mqtt.DAO.EquipmentDAO;
import com.example.mqtt.DAO.RecoverDAO;
import com.example.mqtt.DAO.WarningDAO;
import com.example.mqtt.Entity.EquipmentEntity;
import com.example.mqtt.Entity.RecoverEntity;
import com.example.mqtt.Entity.WarningEntity;
import org.eclipse.paho.client.mqttv3.*;
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ApplicationObjectSupport;
import org.springframework.retry.annotation.Recover;
import org.springframework.stereotype.Component;
import sun.applet.resources.MsgAppletViewer_es;

import java.sql.Timestamp;

public class PushCallback  implements MqttCallback {

    public static final String HOST = "tcp://47.100.136.15";
    private MqttConnectOptions options;
    private static String clientid = "";
    private MqttClient client;





    public void connectionLost(Throwable cause) {
        System.out.println("connectionLost---------连接断开，可以做重连");
    }

    public void deliveryComplete(IMqttDeliveryToken token) {
        System.out.println("deliveryComplete---------" + token.isComplete());
    }

    public void messageArrived(String topic, MqttMessage message) throws Exception {
        System.out.println("接收消息主题 : " + topic);
        System.out.println("接收消息Qos : " + message.getQos());
        String res = new String(message.getPayload());
        System.out.println("接收消息内容 : " + res);


        clientid=System.currentTimeMillis()+"zs2";
        client = new MqttClient(HOST, clientid, new MemoryPersistence());

        client.connect(options);




        //通过上下文的方式获取Service，然后在这个地方保存数据即可
        if(topic.equals("ZUCC-ZS/tah")){

            ApplicationContext context = SpringUtil.context;  //获取Spring容器

            RecoverDAO recoverDAO=context.getBean(RecoverDAO.class);
            EquipmentDAO equipmentDAO=context.getBean(EquipmentDAO.class);
            JSONObject receive=JSON.parseObject(new String(message.getPayload()));
            RecoverEntity recoverEntity=new RecoverEntity();
            Integer id=equipmentDAO.findByEname((String) receive.get("ename")).getId();
            recoverEntity.setEid(id);
            recoverEntity.setHumi((Integer) receive.get("humi"));
            recoverEntity.setTemp((Integer) receive.get("temp"));

            recoverEntity.setSendTime(new Timestamp( System.currentTimeMillis()));

            recoverDAO.save(recoverEntity);


        }else  if(topic.equals("ZUCC-ZS/init")){

            String ename=new String(message.getPayload());

            ApplicationContext context = SpringUtil.context;  //获取Spring容器

            EquipmentDAO equipmentDAO =context.getBean(EquipmentDAO.class);

            EquipmentEntity equipmentEntity=equipmentDAO.findByEname(ename);

            MqttMessage mqttMessage = new MqttMessage();


            JSONObject jsonObject=new JSONObject();
            jsonObject.put("lowert",equipmentEntity.getLowert());
            jsonObject.put("lowerh",equipmentEntity.getLowerh());
            jsonObject.put("hight",equipmentEntity.getHight());
            jsonObject.put("highh",equipmentEntity.getHighh());
            jsonObject.put("deleteflag",equipmentEntity.getDeleteflag());

            mqttMessage.setPayload(jsonObject.toString().getBytes());
            MqttTopic mqttTopic = client.getTopic("ZUCC-ZS/init/"+ename);
            MqttDeliveryToken token = mqttTopic.publish(mqttMessage);
            token.waitForCompletion();


        }else  if(topic.equals("ZUCC-ZS/warning")){
            JSONObject receive=JSON.parseObject(new String(message.getPayload()));

            ApplicationContext context = SpringUtil.context;  //获取Spring容器
            WarningDAO warningDAO= context.getBean(WarningDAO.class);

            ApplicationContext context2 = SpringUtil.context;  //获取Spring容器
            EquipmentDAO equipmentDAO=context2.getBean(EquipmentDAO.class);

            EquipmentEntity equipmentEntity=equipmentDAO.findByEname((String) receive.get("ename"));
            Integer id=equipmentEntity.getId();
            Integer state=equipmentEntity.getState();
            WarningEntity warningEntity=new WarningEntity();
            warningEntity.setDeal(0);
            warningEntity.setMsg((String) receive.get("msg"));
            warningEntity.setSendTime(new Timestamp( System.currentTimeMillis()));
            warningEntity.setEid(id);

            if(receive.get("msg").equals("环境异常")&&state!=2&&state!=3) {

                if(equipmentEntity.getDeleteflag()==0)
                warningDAO.save(warningEntity);

                equipmentEntity.setState(2);
                equipmentDAO.save(equipmentEntity);
                MqttMessage mqttMessage = new MqttMessage();
                mqttMessage.setPayload("update".getBytes());
                MqttTopic mqttTopic = client.getTopic("ZUCC-ZS/update");
                MqttDeliveryToken token = mqttTopic.publish(mqttMessage);
                token.waitForCompletion();
            }
            else if((receive.get("msg")).equals("异常移动")&&state!=3)
            {

                if(equipmentEntity.getDeleteflag()==0)
                warningDAO.save(warningEntity);


                equipmentEntity.setState(3);
                equipmentDAO.save(equipmentEntity);
                MqttMessage mqttMessage = new MqttMessage();
                mqttMessage.setPayload("update".getBytes());
                MqttTopic mqttTopic = client.getTopic("ZUCC-ZS/update");
                MqttDeliveryToken token = mqttTopic.publish(mqttMessage);
                token.waitForCompletion();
            }

        }else  if(topic.equals("ZUCC-ZS/warningrecover")){
            JSONObject receive=JSON.parseObject(new String(message.getPayload()));

            ApplicationContext context = SpringUtil.context;  //获取Spring容器


            EquipmentDAO equipmentDAO=context.getBean(EquipmentDAO.class);

           EquipmentEntity equipmentEntity=equipmentDAO.findByEname((String) receive.get("ename"));
            Integer state=equipmentEntity.getState();
            if((receive.get("msg")).equals("环境异常恢复")&&state!=1) {

                MqttMessage mqttMessage = new MqttMessage();
                equipmentEntity.setState(1);
                equipmentDAO.save(equipmentEntity);
                mqttMessage.setPayload("update".getBytes());
                MqttTopic mqttTopic = client.getTopic("ZUCC-ZS/update");
                MqttDeliveryToken token = mqttTopic.publish(mqttMessage);
                token.waitForCompletion();
            }
            else if(((String) receive.get("msg")).equals("异常移动恢复")&&state!=1)
            {

                MqttMessage mqttMessage = new MqttMessage();
                equipmentEntity.setState(1);
                equipmentDAO.save(equipmentEntity);
                mqttMessage.setPayload("update".getBytes());
                MqttTopic mqttTopic = client.getTopic("ZUCC-ZS/update");
                MqttDeliveryToken token = mqttTopic.publish(mqttMessage);
                token.waitForCompletion();
            }

        }
    }



    @Component
    public static class SpringUtil extends ApplicationObjectSupport {
        public static ApplicationContext context;

        public static Object getBean(String serviceName){
            return context.getBean(serviceName);
        }

        @Override
        protected void initApplicationContext(ApplicationContext context) throws BeansException {
            super.initApplicationContext(context);
            SpringUtil.context = context;
        }
    }
}