package com.kh.onsu.member.model.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.jdbc.JdbcDaoImpl;

public class UserJdbcDaoImpl extends JdbcDaoImpl {
	
	
	// security���� �Ѿ� �°��� loadUsersByUsername���� �Ѿ�´� 
	@Override
	protected List<UserDetails> loadUsersByUsername(String member_id) {
								//security-context���� �Ѿ�� ���� ���������� ���� 
		return getJdbcTemplate().query(getUsersByUsernameQuery(), new String[] {member_id}, new RowMapper<UserDetails>() {
            public UserDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
            	String member_id = rs.getString(1);
                String member_pw = rs.getString(2);
                int r_enabled = rs.getInt(3);
                //�ش� username, password, enabled ������ ����´� 
                
                boolean enabled= false; 
                if(r_enabled ==1) enabled= true;
                
                System.out.println("username: " + member_id+", password: " + member_pw + "enabled: " + enabled);
                
                //���ο� new ��ü�� �����ؼ� ��� �ִ� ������ �ϳ��� �־��༭ ���Ӱ� ���� ���ش� .
                return new User(member_id, member_pw, enabled, true, true, true,AuthorityUtils.NO_AUTHORITIES);            
             }
        });
	}
	
	
	//security�� �ִ� �ش� �������� �´� ��� ���� ���� �޴´�.  AuthoritiesByUsernameQuery 
	@Override
	protected List<GrantedAuthority> loadUserAuthorities(String member_id) {
		return getJdbcTemplate().query(getAuthoritiesByUsernameQuery(), new String[] {member_id},
			new RowMapper<GrantedAuthority>() {

				@Override
				public GrantedAuthority mapRow(ResultSet rs, int rowNum) throws SQLException {
					String roleName = getRolePrefix() + rs.getString(2);
					System.out.println("roleName: " + roleName);
					
					//�ش� �������� �´� ���� simpleGrantedAuthority�� �־��ش� 
					return new SimpleGrantedAuthority(roleName);
				}
				
			});
	}
	
}
