package com.example.doktor.config;

import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	@Qualifier("customUserDetailsService")
	UserDetailsService userDetailsService; 
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(new BCryptPasswordEncoder());
	}
	
    @Override
    protected void configure(HttpSecurity security) throws Exception {
//     security.httpBasic().disable();
    	security.csrf().disable().authorizeRequests()
    	 .antMatchers("/auth/**") //sve putanje koje pocinju sa auth je dostupna svima
    	 .permitAll() //dostupno svima
    	 .antMatchers("/admin/**") .hasAnyRole("ROLE_ADMIN")
    	 .antMatchers("/doktor/**").hasAnyRole("ROLE_DOKTOR")
    	 .antMatchers("/pacijent/**").hasAnyRole("ROLE_PACIJENT")
    	 .and()
    	 .formLogin()
    	 .loginPage("/auth/loginPage")
    	 .loginProcessingUrl("/auth/login")
    	 .usernameParameter("username")
    	 .passwordParameter("password")
    	 .defaultSuccessUrl("/auth/pocetna", true)
    	 .failureForwardUrl("/index.jsp")
    	 .and()
    	 .rememberMe()
    	 	.tokenValiditySeconds((int) TimeUnit.DAYS.toSeconds(21))
    	 	.key("Very secured :))))")
    	 	.rememberMeParameter("remember-me")
    	 .and()
    	 .logout()
    	 .logoutUrl("/auth/logout")
    	 .logoutRequestMatcher(new AntPathRequestMatcher("/logout", "GET"))
    	 .clearAuthentication(true)
    	 .invalidateHttpSession(true)
    	 .deleteCookies("JSESSIONID", "remember-me")
    	 .logoutSuccessUrl("/");
    }
}