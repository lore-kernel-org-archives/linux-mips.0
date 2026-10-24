Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792878282;
	b=JLepeI8ODfZxIMNRXFXO1aEERmKeKmddp7rVpV2FTVsfpJzGppiT0uHr0J6T8wTK+8hw
	 cNFh8iLW/2m5D5Z3YcqUXLAfmnQvHIt1hDikF8AOp7XGiZoVOOEwM8N1VdAoVnhNo/pZL
	 RziX+cYPBgjIDFjS3b0XvMkZcPppoU5qtwYnbJ0wNZq7Yaua2xKlqXt6HtHQBMpqK7+3P
	 xF8w1QseKZKUHWh8GSn/blUpjzsESofeQLubTKrG4xA0wqWVt9dEpSzS6szThOHTGyqsS
	 yx7jkF4GSkdFQ+BSNsQrdS7cY5rBjPZhiua3/D6OjiNtEPygXNyesfEerJ0fMuuLkog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792878282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+1qrwGO4vUyqJglxRfagf9rA3ylSrmZ6wtpakT3V5ZA=;
	b=MyDuMp3EX7HR+/1Do8hkFZgYeJFkfE1viWHKROaszkn/mg7RItb36JPCd4mm1cna8F34
	 IDw0AM871M2kzBxSJjqCYeAAh79aKMa2HSNULQIcP1YaJuJ4LFBKU2ChvDga1SDbuf3WE
	 RqU8jqTy5IyMG5LHXt+2yubf/SXtqEt/J2a5FhhbhsR2ZyZKy8p56r7SraSzRyyXNtRY8
	 iKT9gKrw+Smxm9h7Ux/sgUgNIx0a7xFeMg8+RshKUpg7XfXWBnVCJcex+EP7zMte5Y9N8
	 dg+j6PXML7BU1jHAurSfKp6lKI/EFY4ovBbbiDDEKV14t9F8A8LXAb1HIsMuBUiV2Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=kg6wz1St;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4775606A31D
	for <linux-mips@vger.kernel.org>; Sat, 24 Oct 2026 21:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4775606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=kg6wz1St
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so249285e9.0
        for <linux-mips@vger.kernel.org>; Sat, 24 Oct 2026 14:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792878280; x=1793483080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+1qrwGO4vUyqJglxRfagf9rA3ylSrmZ6wtpakT3V5ZA=;
        b=kg6wz1StvZeFIZRvDNOu3iwpYO76N+zpDAAteho38xZvyhz5w6MXvb7zNdhj0z/11w
         xyPfY6wkx4vKHDbuiYSPSyuzAPNkaHMP2qhe81rw5Ln6fS3jzBmC5GeNPf3xFyu9gfMn
         Di49GIpvUgeajEW309DN7g1NOgm30kYyX6mBWdG/GiS2XzsaOTHQqYTkS5z2rTd8kk7W
         JEW08VSARkuBEhU0usof+UI8/++JARTisdBCmFLy76Zb1PhzPtA7KbK2m1HcfT6vJTW9
         zdmJG9jSbVhE2Zv0zHFKSqzg3CAgn1mFpHc9YgPODgjmlmG8DMTzX4WH4ybyffYWc7xz
         iZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792878280; x=1793483080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+1qrwGO4vUyqJglxRfagf9rA3ylSrmZ6wtpakT3V5ZA=;
        b=pfBFxrv23vuNa6hFWd6C9D9dz5aPS0JWf2KHijeLRIkYNQJEkjdFv5QrjuwtroQtW9
         f4ZmG1O/HfpwvWzWZd4363fQA+VmrzeY4u07URzyBHB/XmZv2VHVtHzKRFsy7RXgCaBp
         obKI01zPuobnMTv+lZSHO2DQm/rvtX0END0kaimzdQsr/PeJm03QpY46oeRufL3zv9pH
         PgAx46257twlq5AZKkyBAnZWnJmTBRAUscdiO/iU2xRKu47/bRWfL8OR4knenKaYXdov
         foAgmq8DfYWFXaB2W48m5QbSbi7AI03yVrsdGxRLvlc+vhlvOo6BbWDlyXBtaleyHDCi
         VRyA==
X-Forwarded-Encrypted: i=1; AKwUvByw5kIutlsGYnTJ/cjXT56ytstvHmc0h4Fxzk4FVroWLb7sCygSMX/7jMiim0V91vsOKKqygMwssAM5@vger.kernel.org
X-Gm-Message-State: AFq9FYIOrbzBpsrlmPewYUJVAjMxZDc+PUwO/pjspdDBDkXHNR0I454V
	W+IhbzMVInVXM/n6Q8jJvxMkxARx9YtbZWtMdcQWPs26lu/Y+bcsJDtbs0nfKttBLrhefUar48U
	Qlq2gPTU=
X-Gm-Gg: AYBFou0FD7KhFvxn9hO7J5SjVBmCgj6BScrsE9+GxxX0SQZRx1AKQ8i67++6EzlvcFa
	X4U357rqA847jHuB+LUD/6yt3czfhNVr9sfUhGFH5gK95aGzJ/azVR7jSwo5NVfZUpCZsg9v5OV
	HE9S7yZFv+kquN05egmUxET7K9wY3rVVEj/fwobyKd+fK8QwTI714em/gBNzjkxCr2u22FsB7qP
	55zpziojDV223a/oEedFzSVfg3DOK3oq5b913wYEXNKzLMrnCWfjON2WbJf+dC4zjb18fRdQHwW
	YFV4CTesJ8MMKgKAB8o5AUcdc6f9S1bBRaxWPa94KraDmFtpSaFbmm/aLAH5lb0JauIYRhi0s7u
	Ndi0Vllp1h5ZfJjnhjiKHunB12oL2R53RV+dM+KVIP0UAZ8SqLY31V2bSj2iQD1tZ5/DeclArmA
	TpZax3PhOH+lGE+TsxXwAh56BeumArDmCsiYLrNiZXgEZAr+sYxb0TjtULA+43Y/mqr1LJwC9TN
	8keMgOJ8+OHHteatqr9yu0cXGqmriwGDY786M+f8tV4b3uK8G3ulgzBItLos56P7XUK8gD8EAFZ
	dvhlWPzvQlbY+iyw5Cjd9RZWWCy8S5hUCa7k4jPBoxmYuZOFwXCZ9a3xQgFuj//sYiu6WVyKug=
	=
X-Received: by 2002:a05:600c:c490:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4a35aeb0eedmr49803455e9.17.1792878280151;
        Sat, 24 Oct 2026 14:44:40 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2ed5a2sm80447905e9.15.2026.10.24.14.44.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 14:44:39 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v3 0/2] ASoC: jz4740-i2s: Add the X1600
Date: Sat, 24 Oct 2026 23:44:36 +0200
Message-ID: <20261024214438.33342-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
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

The X1600's AIC differs from the X1000's in its bit clock divider (the
divider itself, even values only) and in how it plays mono (a channel
count in AICCR, no MONO_TO_STEREO). Tested on a HiBy R1.

Changes since v2:
- The channel field is bits 26:24, not 27:24 (bit 27 is reserved), as
  Nikolaus pointed out from the X1600 programming manual.
- Don't set MONO_TO_STEREO on the X1600: bit 11 is reserved there.
  Listened to on the R1, a mono stream sounds the same with it set or
  clear, held clear from before the stream starts included.
- Commit messages say what the manual says, and the X1000 is left as
  it is.
- Rebased on broonie/for-next.

v2: https://lore.kernel.org/all/20261023152011.85407-1-olivier@mgcrea.io/

Olivier Louvignes (2):
  ASoC: dt-bindings: ingenic,aic: Add the X1600
  ASoC: jz4740-i2s: Add support for the X1600

 .../bindings/sound/ingenic,aic.yaml           |  1 +
 sound/soc/jz4740/jz4740-i2s.c                 | 48 +++++++++++++++----
 2 files changed, 40 insertions(+), 9 deletions(-)


base-commit: cc3fc99f1bce93c3ae3771ef98cb91a566da857e
--
2.39.5

