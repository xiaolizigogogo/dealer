package com.utonw.utonerp.config;


import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.core.*;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/**
 * Created by WANGYJ on 2017/8/16.
 */
@Configuration
public class RedisConfiguration {
    private JedisConnectionFactory jedisConnectionFactory = null;

    @Value("${spring.jedis.host}")
    private String redisHost;
    @Value("${spring.jedis.port}")
    private int redisPort;
    @Value("${spring.jedis.password}")
    private String password;


    @Bean(name= "jedisPool")
    public JedisPool jedisPool(@Qualifier("JedisPoolConfig") JedisPoolConfig config,
                               @Value("${spring.jedis.host}")String host,
                               @Value("${spring.jedis.port}")int port) {
        return new JedisPool(config, host, port);
    }

    @Bean(name= "JedisPoolConfig")
    public JedisPoolConfig jedisPoolConfig (@Value("${spring.jedis.pool.config.maxtotal}")int maxTotal,
                                            @Value("${spring.jedis.pool.config.minidle}")int maxIdle,
                                            @Value("${spring.jedis.pool.config.maxwait}")int maxWaitMillis) {
        JedisPoolConfig config = new JedisPoolConfig();
        config.setMaxTotal(maxTotal);
        config.setMaxIdle(maxIdle);
        config.setMaxWaitMillis(maxWaitMillis);
        return config;
    }
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
