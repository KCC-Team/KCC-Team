package com.kcc.springmini.global.auth;

import com.kcc.springmini.domain.member.model.vo.MemberVO;
import com.kcc.springmini.domain.member.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class PrincipalDetailService implements UserDetailsService {

    private final MemberRepository memberRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        MemberVO member = memberRepository.findById(username);
        if (member != null) {
            return new PrincipalDetail(member);
        }
        return null;
    }
}
