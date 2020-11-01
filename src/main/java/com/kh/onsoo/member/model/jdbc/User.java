package com.kh.onsoo.member.model.jdbc;

import java.io.Serializable;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class User implements UserDetails {

	private String member_id;  // db 값
	private String member_pw;	// db 값	
	private boolean enabled; // db 값
	boolean accountNonExpired;   				//나머지는 true로 세팅 
	boolean credentialsNonExpired;				// true
	boolean accountNonLocked;					// true
	private Set<GrantedAuthority> authorities;// true
	
	
	
	public User(String member_id, String member_pw, Collection<? extends GrantedAuthority>authorities) {
		this(member_id ,member_pw ,true ,true ,true ,true ,authorities);
	}
	
	
	
	public User(String member_id, String member_pw, boolean enabled, boolean accountNonExpired,
			boolean credentialsNonpired,boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities) {
		if ((member_id == null) || "".equals(member_id)|| (member_pw== null)) {
			throw new IllegalArgumentException("Cannot pass null or empty values to constructor ");
		}
		
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.enabled = enabled;
		this.accountNonExpired = accountNonExpired;
		this.credentialsNonExpired = credentialsNonpired;
		this.accountNonLocked = accountNonLocked;
		this.authorities = Collections.unmodifiableSet(sortAuthorities(authorities));
		
	}
	public User(String member_id, String member_pw, boolean enabled) {
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.enabled= enabled;
	}
	
	public User(String member_id, String member_pw, boolean enabled, Set<GrantedAuthority> authoritiesu) {
		this.member_id= member_id;
		this.member_pw= member_pw;
		this.enabled = enabled;
		this.authorities = authorities;
	}
	
	//ID
	@Override
	public String getUsername() {
		return member_id;
	}
	
	public void setMember_id(String member_id) {
		this.member_id=member_id;
	}
	
	
	//PW
	@Override
	public String getPassword() {
		return member_pw;
	}
	
	
	
	
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	
	//계정이 활성화 되었는가? 
	@Override
	public boolean isEnabled() {
		return this.enabled;
	}
	
	public void setEnabled(boolean enabled) {
		this.enabled=enabled;
	}
	
	
	//권한 
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return authorities;
	}
	
	public void setAuthorities(Set<GrantedAuthority> authorities) {
		this.authorities = authorities;
	}
	
	
	// 계정이 만료되지 않았는가 ? 
	@Override
	public boolean isAccountNonExpired() {
		return this.accountNonExpired;
	}
	
	
	//계정이 잠기지 않았는가 ? 
	@Override
	public boolean isAccountNonLocked() {
		return this.accountNonLocked;
	}
	
	
	// 패스워드가 만료되지 않았는가?
	@Override
	public boolean isCredentialsNonExpired() {
		return this.credentialsNonExpired;
	}
	
	
	//권한 목록에 있는 정보가 여러개 넘어올수 있으니 정렬하는 기능으로 사용  sortAuthorities
	private static SortedSet<GrantedAuthority> sortAuthorities(Collection<? extends GrantedAuthority> authorities){
		SortedSet<GrantedAuthority> sortedAuthorities =
				new TreeSet<GrantedAuthority>(new AuthorityComparator()); 
		for(GrantedAuthority grantedAuthority : authorities) {
			sortedAuthorities.add(grantedAuthority);
		}
		return sortedAuthorities;
	}
	
	
	private static class AuthorityComparator implements Comparator<GrantedAuthority>, Serializable{
			
		public int compare(GrantedAuthority g1, GrantedAuthority g2) {
			if(g2.getAuthority() == null) {
				return -1;
			}
			if(g1.getAuthority() == null) {
				return 1;
			}
			return g1.getAuthority().compareTo(g2.getAuthority());
		}
	}


	
	
	
	
	
	
	
	
	




}
