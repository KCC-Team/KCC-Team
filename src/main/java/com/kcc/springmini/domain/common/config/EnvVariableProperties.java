package com.kcc.springmini.domain.common.config;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix = "cloud.aws")
@Getter @Setter
public class EnvVariableProperties {
    private String accessKey;
    private String secretKey;
    private String region;
    private S3 s3;

    @Setter @Getter
    public static class S3 {
        private String bucket;
        private String url;

    }
}
