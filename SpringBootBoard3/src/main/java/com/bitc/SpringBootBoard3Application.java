package com.bitc;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.convert.threeten.Jsr310JpaConverters;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

// Jsr310JpaConverters : 자바7버전 이하에서 시간관련 클래스를 사용하기 힘든 문제가 있어서 자바 8버전에서 JSR-310 표준 명세로 날짜 및 시간에 관련된 새로운 API가 추가됨
// MYSQL 사용 시 자바 및 MySQL의 번전에 따라서 날짜 및 시간 관련 클래스에서 문제가 발생될 가능성이 있기 때문에 이를 해결하기 위해 Jsr310JpaConverters를 사용함

// EntityScan : basePackages로 지정한 패키지 하위에서 JPA 엔티티(@Entity 어노테이션이 설정된 클래스들)을검색

@EnableJpaAuditing
@EntityScan(
		basePackageClasses = {Jsr310JpaConverters.class},
		basePackages = {"bitc"}
		)

@SpringBootApplication
public class SpringBootBoard3Application {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootBoard3Application.class, args);
	}

}
