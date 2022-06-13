package com.example.demo.controller;

import com.alibaba.fastjson.JSONObject;
import com.example.demo.dao.CarDAO;
import com.example.demo.entity.CarEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.lang.reflect.Array;
import java.util.ArrayList;

@Transactional
@CrossOrigin
@RestController
@RequestMapping(value="/car")
public class CarController {

    @Autowired
    CarDAO carDAO;

    @RequestMapping(value="/list",method= RequestMethod.GET)
    public JSONObject listcar(@RequestParam(value = "page") int page)  {

        JSONObject result=new JSONObject();

        ArrayList<CarEntity> pagelist= (ArrayList<CarEntity>) carDAO.findAll();
        if(pagelist.size()<(page*6))
        {
            result.put("data",null);
        }
        else {
            if (pagelist.size() > (page * 6 + 6))
                result.put("data", pagelist.subList(page * 6, page * 6 + 6));
            else
                result.put("data", pagelist.subList(page * 6,pagelist.size()));

        }
        result.put("data",carDAO.findAll());
        result.put("line1",carDAO.findTop2ByAndShowlineIs(1));
        result.put("line2",carDAO.findTop2ByAndShowlineIs(2));
        result.put("line3",carDAO.findTop2ByAndShowlineIs(3));
        result.put("line4",carDAO.findTop2ByAndShowlineIs(4));
        result.put("port","200");
        return result;

    }



    @RequestMapping(value="/all",method= RequestMethod.GET)
    public JSONObject listallcar()  {

        JSONObject result=new JSONObject();


        result.put("data",carDAO.findAll());

        result.put("port","200");
        return result;

    }


    @RequestMapping(value="/listsort",method= RequestMethod.GET)
    public JSONObject listcarby(@RequestParam(value = "kind") int kind,@RequestParam(value = "type") int type,@RequestParam(value = "min") int min,@RequestParam(value = "max") int max)  {

        JSONObject result=new JSONObject();
        ArrayList<CarEntity> carlist=new ArrayList<>();
        if(kind==1)
        {
            if (type==6){
                carlist= (ArrayList<CarEntity>) carDAO.findByMoneyGreaterThanEqualAndMoneyLessThanEqualOrderByMoneyAsc(min, max);
            }else{
                carlist= (ArrayList<CarEntity>) carDAO.findByMoneyGreaterThanEqualAndMoneyLessThanEqualAndTypeIsOrderByMoneyAsc(min, max,type);
            }

        }else if(kind==2){
            if (type==6){
                carlist= (ArrayList<CarEntity>) carDAO.findByMoneyGreaterThanEqualAndMoneyLessThanEqualOrderByMoneyDesc(min, max);
            }else{
                carlist= (ArrayList<CarEntity>) carDAO.findByMoneyGreaterThanEqualAndMoneyLessThanEqualAndTypeIsOrderByMoneyDesc(min, max,type);
            }
        }else{
            if (type==6){
                carlist= (ArrayList<CarEntity>) carDAO.findByMoneyGreaterThanEqualAndMoneyLessThanEqualOrderBySaleDesc(min, max);
            }else{
                carlist= (ArrayList<CarEntity>) carDAO.findByMoneyGreaterThanEqualAndMoneyLessThanEqualAndTypeIsOrderBySaleDesc(min, max,type);
            }
        }

        result.put("data",carlist);
        result.put("port","200");
        return result;

    }


}
