/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.components;

import java.util.Map;
import org.springframework.stereotype.Component;

/**
 *
 * @author LONG
 */
@Component
public class HandlePageParam {

    private static final Integer DEFAULT_PAGE = 1;
    private static final Integer PAGE_SIZE = 4;

    public Integer handlePage(Map<String, String> params) {
        if (params != null && !params.isEmpty()) {
            String paramPage = params.get("page");
            if (paramPage != null && !paramPage.isEmpty()) {
                return Integer.parseInt(paramPage);
            }
        }

        return DEFAULT_PAGE;
    }

    public void responsePageObject(Map<String, Object> response, Integer currentPage, Integer pageSize, Integer totalItem) {
        response.put("page", currentPage.toString());
        response.put("pageSize", pageSize.toString());
        response.put("totalItem", totalItem.toString());
        response.put("totalPage", (int) Math.ceil((double) totalItem / pageSize));
    }

    /**
     * @return the PAGE_SIZE
     */
    public static Integer getPAGE_SIZE() {
        return PAGE_SIZE;
    }
}
