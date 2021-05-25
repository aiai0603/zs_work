package com.example.demo.jwt;

import com.auth0.jwt.interfaces.Claim;

public class PermitUtil {

    public static int getPermit (String token){
        int relo = 0;
        try {

            if(JwtUtil.verifyToken(token).get("relo") == null){
                return 0;
            }else{

                relo = JwtUtil.verifyToken(token).get("relo").asInt();
            }

        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }


        if(relo == 1){
            return 1;
        }else{
            return 2;
        }

    }
}
