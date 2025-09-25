package com.yedam.uriban.myclass.service.Impl;

import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;

import reactor.core.publisher.Mono;


@Service
public class WebClientService {
    private final String apiUrl = "https://open.neis.go.kr/hub/mealServiceDietInfo?Type=json&pIndex=1&pSize=100&ATPT_OFCDC_SC_CODE=T10&SD_SCHUL_CODE=9290083";
    private final WebClient webClient;

    public WebClientService(WebClient.Builder webClientBuilder) {
        this.webClient = webClientBuilder.baseUrl(apiUrl).build();
    }

    public Mono<String> fetchMealData() {
        return webClient.get()
            .retrieve()
            .bodyToMono(String.class);
    }
}
 