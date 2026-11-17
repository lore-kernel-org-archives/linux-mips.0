Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933583;
	b=LSpN/i6PIlEYHBximFIOFgCez9kRjiC+X7fCAuv9tM8sqsRsq6mJjKzyIVYWjimdyAdw
	 H9+n9Ziam75ZVli90W06kfRUpz+noBi4f0thPteSn+20+Z8KWRbEWkb0wAjGqPXEIEl8W
	 qfDGUZqoFC+gktEi+xwjM3jJHp1wQebZPUTDcauz7219x0AsSsr1iIeukYIm9Fq5JX7Iv
	 6n9BHuGJRq/hkwj1H8BXrR6x/p5QWxy6R4/X4pXWl2JZXyvcWEuUw/vcD67rU55LbwPaH
	 BtUJzGOjhduQfUgaNZ6/BlgvZrXbrQi0RAQ8yaZw7fzUM/T3ZyY2HDAVaXvZxte06Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=0Ulm0G03sCySHIhrtUq93+/xbXgYkzf0aPutKqa+d+g=;
	b=nWllAMOOQrvgvwM0UE0LrnJKbK9K1eTBvjYl0zURaNFR1r45oCrzki5VvqivQYI34dh1
	 upHRahky3khkOZhiBm/2ogbVDWiJf1tVJuCDxxvb5BsSmmq8H8yvr+BJvEKNYmYb2hm5c
	 sR90Zuk3zflW+1EpmZtcG9mv9KvgpWzGNydVmDvPYE9dtYtyUcTZJiyhiH1U3KS+35aBd
	 c9PFzmSnTHHlEXltMs7tGVU1Oz3gg339ocfsrfMX7vP6t74fe2fJ52KvBQe8W31KX7aME
	 mk3RlUm7ZhpRALDFT9d4k92g10RXv3aYofWckRs2oV461v3XcvkAvSjW9iWyFF9Toag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tJhgbQOc;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C077C606A33A
	for <linux-mips@vger.kernel.org>; Tue, 17 Nov 2026 16:39:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C077C606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tJhgbQOc
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a42b34e930so740231f8f.2
        for <linux-mips@vger.kernel.org>; Tue, 17 Nov 2026 08:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794933581; x=1795538381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Ulm0G03sCySHIhrtUq93+/xbXgYkzf0aPutKqa+d+g=;
        b=tJhgbQOcgcJYobi/hzdSu+8Tt2qQ/2dZNmpPk4e+ZxI2eSqPJl8HZJp5LUzmlv3xZp
         XIO81DoGsShLYYtFTH8aCx+OkEoU2mrdab+0hsyWgOqDSDyVjyR3136BgT9DqiKdloTW
         sn7yJWqorQHQGl7zYdpYaSmMWxhjU4GjiSbB1Nx3169z69VHnec5I4nZAK3eyB0fr3P+
         HqKVmEEs1hYmQ2JMg8EyU6rDtG411OwBCPVZiJjEa6TTzt702ckdWyfWIEBzcfQ8su3f
         wcjVe1kS+wq7QXhWd4pu91uZEALN/Ae0dQNV+/HLRbh0fPZfjXJtT6ReBtJo1KAvufa5
         DhVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933581; x=1795538381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Ulm0G03sCySHIhrtUq93+/xbXgYkzf0aPutKqa+d+g=;
        b=kiwkwuC437to2h8g7NH7B0eGyODg6VKhmWYKqTggJeYMRDJJYmT4wwT4hds/B+0dnm
         YQ9MXzOYx0ZaTo5PfHn7O5TlP6M2YvUhszRuBPrT94qT+yOxu3Jj0hZwHgFsrJrEICI/
         3w7hrpvAnRLD/Ehxoh/JW4TJG0jXn6wOFWSRrjxzB7it1juswmO7lm4BK/+FKKdXa/M2
         HQAUiQLS5fS05yaBZ7x/ietubJUdecpDA903b9YZGnr4bl/KE+DFczNx5fxczvyezR4w
         SIsmXC1RYTCwLhIa8qSDvZm67FehyAbYHh+icd+l69rU7aWhqfljWH1d7q/ghz4TTezW
         08iw==
X-Gm-Message-State: APuU4Z/UhEpSFpoUNbJMQK+jrB2pyVhiZ4XegKghEzGDWCE6XOzydaV3
	yMoOVAFvkhm1bD/yBrzOmewEVH5xJBBtInlWNLj3Pnz4ciup0p65RQtZ
X-Gm-Gg: AZFdTZdgFi1Dyd+rRBeewKMYpu4+SvfxNLGOYHN0vhkQ30M4M6KEOJdwmG7d+yGGnuv
	bXu6Ekk9KFkaO1OfaiFCl/MRoFZHk9h6oIMhRE2nqJTlEBdWvW0RuNNONckd9SxyDIiigf/PNYU
	LgIJdloaVzgheoBs8MCquE8MqMK+qRGZP11z42TjkmxFqTtelce3y+BICT7Fqfbq1/a3DrDGpz2
	Owy2//Q10PdjxaNh5/YGAKPAI4gJgvhKyL8wWTGg5G5CzWonHzmq+SVWTOFthnT82OdiCjcW0XB
	WXifCExspiS/Soi+PyxoF2tQA1IfRfUMl14iMYgHKK+XFVt3m1uq3ExWfhZNoK0drh1dGc5CYTE
	FpxIkxN27BLja/ITlN27g1IU6PCWjme6fDzmOqW/U1216AlUbyfxjV6Wjdp4q6aHo62qPhSv1iO
	VUa8CC4lOeXX2NEE4i+PY6f3ExoA7X0n/Cp/SXTX1uwLpYjPwUkhgZccxW9d90zmGvQOuwf5IMY
	YTf5qtE+633r0aaOZnoin+TOzumCNiG9uNe2inyJMviUf2tmrdMjslh2HwDZF2h4bQDT19QNljA
	xNAdVO3G3RurM8+yItaJGm5aFIvYJkuu763mJ9+V+Yjk/xcte/iDvmW3Y3La6ieLdN31S4QqGFX
	FNZmRSETBtis901EfzCSwZoBiOVPEDkSouXQFqwV3X+UCOoqM
X-Received: by 2002:a05:6000:29d3:b0:48e:6a23:4a09 with SMTP id ffacd0b85a97d-49c731641bamr21234472f8f.54.1794933580972;
        Tue, 17 Nov 2026 08:39:40 -0800 (PST)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f78214dsm29292716f8f.25.2026.11.17.08.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:39:40 -0800 (PST)
From: Orgad Shaneh <orgads@gmail.com>
To: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] MIPS: OCTEON: program L2C_CTL on CNF71XX too
Date: Tue, 17 Nov 2026 16:39:39 +0000
Message-ID: <20261117163939.3727065-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit bd978130307c ("MIPS: OCTEON: program L2C_CTL, not L2C_CFG,
on OCTEON II"), cvmx_helper_initialize_packet_io_global() writes L2C_CTL
instead of L2C_CFG, because L2C_CFG does not exist on OCTEON II and
writing it hangs a CN6335. The test is OCTEON_CN6XXX, which leaves the
CNF71XX - also an OCTEON II, as OCTEON_IS_OCTEON2() and the rest of this
file treat it - writing the register that commit says is not there.

Use OCTEON_IS_OCTEON2(). OCTEON III (CN7XXX) still takes the L2C_CFG
path, as before: I have no such part and do not know which register it
wants.

Fixes: bd978130307c ("MIPS: OCTEON: program L2C_CTL, not L2C_CFG, on OCTEON II")
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
RESEND: bd978130307c is in v7.4-rc1 now; this still applies there
and to mips-next. No change but the Assisted-by tag, now dropped (an
LLM helped write this patch).
v1: https://lore.kernel.org/all/20261019034918.3805764-1-orgads@gmail.com/

Found by the Sashiko review bot on the original series. By inspection
only: I have no CNF71XX board to test on.

diff --git a/arch/mips/cavium-octeon/executive/cvmx-helper.c b/arch/mips/cavium-octeon/executive/cvmx-helper.c
index 107b1be..c02448b 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-helper.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-helper.c
@@ -1028,7 +1028,7 @@ int cvmx_helper_initialize_packet_io_global(void)
 	 * to the cores. This avoids conditions where IO blocks might
 	 * be starved under very high L2 loads.
 	 */
-	if (OCTEON_IS_MODEL(OCTEON_CN6XXX)) {
+	if (OCTEON_IS_OCTEON2()) {
 		union cvmx_l2c_ctl l2c_ctl;
 
 		l2c_ctl.u64 = cvmx_read_csr(CVMX_L2C_CTL);
