package com.example.mqtt.Controller;

import com.alibaba.fastjson.JSONObject;
import com.example.mqtt.DAO.EquipmentDAO;
import com.example.mqtt.DAO.ManagerDAO;
import com.example.mqtt.Entity.AdminEntity;
import com.example.mqtt.Entity.EquipmentEntity;
import com.example.mqtt.Entity.ManagerEquipEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

@Transactional
@CrossOrigin
@RestController
@RequestMapping(value="/manager")
public class ManagerController {

    @Autowired
    ManagerDAO managerDAO;

    @Autowired
    EquipmentDAO equipmentDAO;

    @RequestMapping(value="/unmanager",method= RequestMethod.GET)
    public JSONObject loginAdmin(@RequestParam(value = "eid") Integer eid,@RequestParam(value = "uid") Integer uid)  {

        JSONObject result=new JSONObject();
        managerDAO.unmanager(eid,uid);
        result.put("port","200");
        return  result;

    }

    @RequestMapping(value="/add",method= RequestMethod.GET)
    public JSONObject addEquipmenet(@RequestParam(value = "eid") String eid,@RequestParam(value = "uid") Integer uid)  {

        JSONObject result=new JSONObject();
        EquipmentEntity equipmentEntity=equipmentDAO.findByEname(eid);
        if(equipmentEntity==null){
            result.put("port","400");
            result.put("msg","没有此编号的设备");
        }else{
          ManagerEquipEntity managerEquipEntity= managerDAO.findByDeleteflagIsAndEidIsAndUidIs(0,equipmentEntity.getId(),uid);
            if(managerEquipEntity==null){
                result.put("port","200");
                ManagerEquipEntity managerEquipEntity2=new ManagerEquipEntity();
                managerEquipEntity2.setEid(equipmentEntity.getId());
                managerEquipEntity2.setDeleteflag(0);
                managerEquipEntity2.setUid(uid);

                managerDAO.save(managerEquipEntity2);
                result.put("msg","添加成功");
            }else{
                result.put("port","400");
                result.put("msg","该设备已经被绑定");
            }
        }



        return  result;

    }


}
