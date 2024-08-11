package com.exercise.devs.utils;

import org.springframework.data.domain.Page;
import org.springframework.http.HttpHeaders;

public class PaginationHeaders {

    public static HttpHeaders createPaginationHeaders(Page<?> page) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("X-Total-Pages", String.valueOf(page.getTotalPages()));
        headers.add("X-Total-Elements", String.valueOf(page.getTotalElements()));
        headers.add("X-Current-Page", String.valueOf(page.getNumber() + 1));
        headers.add("X-Page-Size", String.valueOf(page.getSize()));
        return headers;
    }
}
