package com.utonw.buyer.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.core.DefaultClusterOperations;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.ListOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.SetOperations;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.data.redis.core.ZSetOperations;

import redis.clients.jedis.JedisPoolConfig;

/**
 * Created by SEELE on 2017/5/16.
 */
@Configuration
public class RedisConfig {

    private JedisConnectionFactory jedisConnectionFactory = null;

    @Value("${spring.redis.host}")
    private String redisHost;
    @Value("${spring.redis.port}")
    private int redisPort;
    @Value("${spring.redis.password}")
    private String password;
    @Bean
    public JedisPoolConfig getJedisPoolConfig() {
        JedisPoolConfig jedisPoolConfig = new JedisPoolConfig();
        return jedisPoolConfig;
    }

    @Bean
    public JedisConnectionFactory connectionFactory() {
        if (jedisConnectionFactory == null) {
            jedisConnectionFactory = new JedisConnectionFactory();
            jedisConnectionFactory.setPoolConfig(getJedisPoolConfig());
            jedisConnectionFactory.setUsePool(true);
            jedisConnectionFactory.setHostName(redisHost);
            jedisConnectionFactory.setPort(redisPort);
            jedisConnectionFactory.setPassword(password);
        }
        return jedisConnectionFactory;
    }
    @Bean
    public RedisTemplate redisTemplate(){
        RedisTemplate redisTemplate=new RedisTemplate<>();
        redisTemplate.setConnectionFactory(connectionFactory());
        redisTemplate.setKeySerializer(new org.springframework.data.redis.serializer.StringRedisSerializer());
        redisTemplate.setHashKeySerializer(new org.springframework.data.redis.serializer.StringRedisSerializer());
        redisTemplate.setValueSerializer(new org.springframework.data.redis.serializer.GenericJackson2JsonRedisSerializer());
        redisTemplate.setHashValueSerializer(new org.springframework.data.redis.serializer.GenericJackson2JsonRedisSerializer());
        return redisTemplate;
    }
    @Bean
    public RedisConnection redisConnection(){
        return connectionFactory().getConnection();
    }
    @Bean
    public HashOperations<String, String, Object> hashOperations(RedisTemplate<String, Object> redisTemplate) {
        return redisTemplate.opsForHash();
    }

    @Bean
    public ValueOperations<String, String> valueOperations(RedisTemplate<String, String> redisTemplate) {
        return redisTemplate.opsForValue();
    }

    @Bean
    public ListOperations<String, Object> listOperations(RedisTemplate<String, Object> redisTemplate) {
        return redisTemplate.opsForList();
    }

    @Bean
    public SetOperations<String, Object> setOperations(RedisTemplate<String, Object> redisTemplate) {
        return redisTemplate.opsForSet();
    }

    @Bean
    public ZSetOperations<String, Object> zSetOperations(RedisTemplate<String, Object> redisTemplate) {
        return redisTemplate.opsForZSet();
    }
}
