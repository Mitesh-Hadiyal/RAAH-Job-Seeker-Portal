package com.quest.demo.mapper;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.quest.demo.model.User;

//@Mapper
//public interface UserMapper {
//
//	@Select("select * from user")
//	public List<User> findAllUser();
//
//	@Select("SELECT * FROM user WHERE id = #{id}")
//	Optional<User> findById(@Param("id") int id);
//
//	@Insert("INSERT INTO user(nickname, phoneNumber, email, firstName, lastName, password) VALUES(#{nickname}, #{phoneNumber}, #{email}, #{firstName}, #{lastName}, #{password})")
//	@Options(useGeneratedKeys = true, keyProperty = "id")
//	void insert(User user);
//
//	@Update("UPDATE user SET nickname = #{nickname}, phoneNumber = #{phoneNumber}, email = #{email}, firstName = #{firstName}, lastName = #{lastName}, password = #{password} WHERE id = #{id}")
//	int update(User user);
//
//	@Delete("DELETE FROM user WHERE id=#{id}")
//	void delete(int id);
//
//	@Select("SELECT COUNT(*) FROM user WHERE nickname = #{nickname}")
//	int countByNickname(String nickname);
//
//	@Select("SELECT COUNT(*) FROM user WHERE email = #{email}")
//	int countByEmail(String email);
//
//	@Select("SELECT COUNT(*) FROM user WHERE phoneNumber = #{phoneNumber}")
//	int countByPhoneNumber(Long phoneNumber);
//
//	@Select("SELECT * FROM user WHERE email = #{email}")
//	Optional<User> getUserByEmail(String email);
//
//	@Select("SELECT * FROM user WHERE phoneNumber = #{phoneNumber}")
//	User getUserByphoneNumber(Long phoneNumber);
//
//
//}
