package com.postgres.sample.dto;

import lombok.Builder;
import lombok.Data;

import java.util.List;

@Data
public class KjoResponse {
    List<?> ObjList;
    Object  obj;

//    @Builder
//    public KjoResponse(List<?> objList, Object obj) {
//        ObjList = objList;
//        this.obj = obj;
//    }
}
