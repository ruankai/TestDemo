package com.yfvccm.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.*;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

import javax.sql.DataSource;

@Configuration
/*
将MyBatisConfig类和JdbcConfig类交给Spring管理
 */
@PropertySource("classpath:jdbc.properties")
@Import({MyBatisConfig.class,JdbcConfig.class})
/**
 *等同于<context:component-scan base-package="com.yfvccm.service">
 */
@ComponentScan( "com.yfvccm.service")
/*开启事务管理
等同于<tx:annotation-driven transaction-manager="transactionManager"/>
 */
@EnableTransactionManagement
public class SpringConfig {
    @Value("${redis.password}")
    private String redisPassword;

    @Value("${redis.port}")
    private Integer redisPort;

    @Value("${redis.timeout}")
    private Integer redisTimeout;

    @Value("${redsi.host}")
    private String redsiHost;
    /*
    等同于<bean class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
     */
    @Bean("transactionManager")
    public DataSourceTransactionManager getDataSourceTxManager(@Autowired DataSource dataSource){
        DataSourceTransactionManager dtm = new DataSourceTransactionManager();
        //等同于<property name="dataSource" ref="dataSource"/>
        dtm.setDataSource(dataSource);
        return dtm;
    }

    @Bean("jedis")
    public Jedis jedis1(){
        JedisPoolConfig config = new JedisPoolConfig();
        config.setMaxTotal(50);
        config.setMaxIdle(10);
        JedisPool jedisPool = new JedisPool(config,redsiHost,redisPort,redisTimeout,redisPassword);
        Jedis jedis = jedisPool.getResource();
        return  jedis;
    }


    //1.创建Jedis连接池对象


//    @Bean("redis")
//    public RedisTemplate redis(){
//        // 配置连接池
//        JedisPoolConfig jedisPoolConfig = new JedisPoolConfig();
//        // 最大空闲数
//        jedisPoolConfig.setMaxIdle(50);
//        // 最大连接数
//        jedisPoolConfig.setMaxTotal(100);
//        // 最大等待亳秒数
//        jedisPoolConfig.setMaxWaitMillis(20000);
//
//        // Redis 连接服务器配置
//        RedisStandaloneConfiguration redisConfig = new RedisStandaloneConfiguration();
//        redisConfig.setHostName("127.0.0.1");
//        redisConfig.setPort(6379);
//        redisConfig.setPassword("");
//
//
//        // 修改 Redis 的连接器 Jedis 的默认连接池
//        JedisClientConfiguration.JedisPoolingClientConfigurationBuilder builder =
//                (JedisClientConfiguration.JedisPoolingClientConfigurationBuilder) JedisClientConfiguration.builder();
//        JedisClientConfiguration jedisClientConfiguration = builder.poolConfig(jedisPoolConfig).build();
//
//        // 采用 Jedis 作为 Redis 客户端,可用用 JedisConnectionFactory 工厂初始化连接池配置
//        JedisConnectionFactory connectionFactory = new JedisConnectionFactory(redisConfig,jedisClientConfiguration);
//
//        // 调用后初始化方法没有它将抛出异常
//        connectionFactory.afterPropertiesSet();
//
//        // 定义 RedisTemplate并设置连接工程
//        RedisTemplate<String,String> redisTemplate = new RedisTemplate<String,String>();
//        redisTemplate.setConnectionFactory(connectionFactory);
//        return redisTemplate;
//    }
}






