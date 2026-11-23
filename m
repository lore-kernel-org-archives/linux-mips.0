Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437478;
	b=qG50CNjWKA7iZe1JNViYLXA6IM0FL97XrOInrxXkxT0i7Ti2ZKUDbvVh+DBrZ1Ch2yZl
	 kOlzLYX5ZaS91c7kkWaL5BDq0x0Rdr6j3KfD/+SPFlh9n224mVUEHiSkDr01br/lZZazY
	 JscC4HkcoTz/d7bZNrLAc4sHELKJHsSy+9XOCbxqPmIInuxeYCmgaaqexl6OZWXAvfmY/
	 ulcY2etUcuETI+AMO8ZtccgMLXn5LCTZAMhluhKlNkX/6uWzF7Pe7Q/aqbgK1Wan0LyTz
	 bhgQYvyrP7P8x3PemqOVdLJwN/R8UtfGQfRLUxNO1gxTTurfrAiBSpnKZA3yYljjq3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4FHRYHmmGVRFcPlTDGmzx/L3A2zzLoxUicG8IqEA4p8=;
	b=4voX4gJtmoodpemZA8bkbfcCrsFfaL1P3wNryPqTkSSgGMvHI9ofHrIt0SdR9a9gZ8EI
	 BZTYt0Yn3b5tMXwS7fFFkiG4i1XpZOReXlkU1NG0md1fftiUHdooOyC6PjQETxnz5P5tp
	 RrIZHe2GA6mj0awIWQlGyMk553EBUEpHiatyR2v4/MCSHcB5aOGkHpHZ+wo/C+bsCwBtA
	 8ds17THy9JbEel1+5rBYRbatRJYDjarID9t74d4731p2eSFzkrxtfOBANSceyWFck6CSt
	 wiBSH5CSTd692ngPAcSD7y0vs5fHKCkXRQorc7jMarDAncBRQYtporiBvsvYTPmbgWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="JQujt/H5";
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224C2606A31F
	for <linux-mips@vger.kernel.org>; Mon, 23 Nov 2026 12:37:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 224C2606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JQujt/H5
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2f04f61282dso11442725ad.1
        for <linux-mips@vger.kernel.org>; Mon, 23 Nov 2026 04:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437477; x=1796042277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4FHRYHmmGVRFcPlTDGmzx/L3A2zzLoxUicG8IqEA4p8=;
        b=JQujt/H5E/i5WTl+jz+YqJXcKepX9mWQBC3heidVAz/a/MvDYSx4nPL8nqCIz1q22E
         KO89UAnp22TmDevPiP/iTEcZwthcMvD5tDn3E2Qf+mzC1yPgUelC+U7VgR9tHGjvhK79
         5Fe9Zr94KqaAMqlpyD0qT7MNTr66FO5GdB/7ISOdrtWSIWCnkpI3/jUWNrhJhOAppYC4
         jcUwz0gXM6YIRC0drO/x3YE2ERT0wSjVCJpkrsS84ekfi5v1eFop50QSswk8Tu3WWPHj
         f6uGbkd6z+B5nSGlKQgLaje2ut13Nx9utjDRqHgkud0N/BgbVpT7CuYydhC6eOmUfNiO
         As4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437477; x=1796042277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4FHRYHmmGVRFcPlTDGmzx/L3A2zzLoxUicG8IqEA4p8=;
        b=0jJsSVWzffyClvmAKsxQ2ItY0Tu1WM5N8XYT6yubFAN4hcdT4jqmnCPB4MrsHAzXbm
         gzrXUE2NU9UtRBqLEEGr75nT1EQX6134gMzguGnkXVo3L/9CgGzVkrGp2XwmBD4KS49S
         H1zB6Ap/Ga1TwhaIKhfSPFLqWqBrnAuKWYSNxjNLt0a4E0kmFxGsa3ZbUmHcFP5ioZEn
         AC/o73A7OZRYo8rFl171IBWy0yiRAJCjpeGtSowNA05TkJbxS/+dvOs8cpJoELlT6v9n
         Tq5UkpeatJ2Hq6GVxt3M2u/cn5fY11HWe5TQpDEL+5jZpR4lGkSUzOKuBIQDKV9VmRmu
         Cs5w==
X-Forwarded-Encrypted: i=1; AL+hErHcScdKpt+N4IO6sp5VdZ6YCYf9GbWJ27MhhQbn1xW8a87Xvr9KFkUprUK2+A8CuojyUiWE+GzooweI@vger.kernel.org
X-Gm-Message-State: APuU4Z/E3HmivYyqKdHaCs1ryKEthsFrX82MC+kb7K6IPWtQfkkLDbNY
	ULKIVeJmAhTJ5oabLcpf/VLJI2wQZWdagUeug5PSqxEXfADDzN3zyN9S
X-Gm-Gg: AZFdTZc+WGA3FKgnUO5aG8FRngPOXHC56iwBSBtbUarnVv14Cwr/Qc18M36duIyZ8o4
	Udry0FelyqIF5qNE778OFeWpymWMITfLIP5hPxlpyE7SqxIDrwgH6H7cDwiUfWLxtqEBI3/pK11
	P/mZGhXPp5BNUbgfYOFbhpPhz1qsNzZFVRQ48K3zgj+KZV3Tt8uKzWng6tV2/FF5vVk3TFsHvNU
	PhiljOjXtO0WfXLlQOc7kEZNEIXYCqB+jO1EqjcnoZnFTpKRCADOBnRIJ8ChIdioncUereodNLL
	wnSbx4X0p45V8MXlH06yRocAs9NVLqmLG2vOUUdiy1R0kSVAMfGU53DuEZqCoon4vLZzQMv5kgG
	8b4CzsTY1+ystFIG/vH9Jdb79p0IFU7TCuGVj0rmDdNZNWnRFBCmgW4WxAcvrmFpnqzNbazsjUQ
	V6U2UHkS2m2DuTXzCPlAA5UxNTxftamyAjhkEgW/10h5B191Q0RsvJA98KSiueoNFqYI3zkE3EH
	zBy91oVI9sy5jKTJyRH9zKZOH1QQ9tMQ500Tmqr/14+ydio5AJ+0kLZ1cLs+x3JNzXmEpH/Tavr
	u91K0ow4z2GnhLsmfxgW+jryxMtCBtCPyw==
X-Received: by 2002:a17:902:e847:b0:2ed:c9bf:9570 with SMTP id d9443c01a7336-2f03f1a4599mr114769615ad.26.1795437477376;
        Mon, 23 Nov 2026 04:37:57 -0800 (PST)
Received: from arm-a100.. ([140.112.28.118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f06c02a92esm32318165ad.40.2026.11.23.04.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:37:56 -0800 (PST)
From: Tzu-Ching Yang <shingekinocore@gmail.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	=?UTF-8?q?Beno=C3=AEt=20Monin?= <benoit.monin@bootlin.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH] MIPS: Make cpu_has_mips64r6 constant on 64-bit r6 kernels
Date: Mon, 23 Nov 2026 20:37:46 +0800
Message-Id: <20261123123746.2963491-1-shingekinocore@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <alpine.DEB.2.21.2611231038330.54328@angie.orcam.me.uk>
References: <20261030140430.1857741-1-shingekinocore@gmail.com> <alpine.DEB.2.21.2610301515350.42255@angie.orcam.me.uk> <20261123035732.728281-1-shingekinocore@gmail.com> <alpine.DEB.2.21.2611231038330.54328@angie.orcam.me.uk>
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

On Mon, 23 Nov 2026, Maciej W. Rozycki wrote:
> > Your form and v1 differ only on pre-r6 kernels. I built both on
>
>  Then you're doing something wrong; with __isa_ge_or_flag() I get:
[...]
> $ objdump -d vmlinux-base | grep -c dclz
> 18
> $ objdump -d vmlinux-has-mips64r6 | grep -c dclz
> 1430

Sorry, I worded that badly: I compared your form with v1, not with
mainline. Against mainline, in bytes of bloat-o-meter -t with GCC
16.2:

  defconfig   your form   v1
  ---------   ---------   -------
  64r6el        -105340   -105340
  32r6el              0         0
  64r2el           +264         0
  32r2el          +3352         0

On the r6 kernels the two give the same vmlinux, byte for byte, so
your form has all of the gain that you show. On the pre-r6 kernels it
makes cpu_has_mips64r6 a run-time test, hence the growth; v1 leaves
their vmlinux as it is.

>  I maintain that __isa_ge_or_flag() is the correct approach.

Understood. v2 will use your form: cpu_has_mips64r6 as cpu_has_64bits
&& __isa_ge_or_flag(6, MIPS_CPU_ISA_M64R6), with __isa_ge_and_flag()
removed.

>  FWIW an early check for the ISA mismatch might be worth having if at all
> feasible, reporting the issue via a firmware printf()-like callback where
> available.  Said JR instruction could be recoded as JALR $0, ... if this
> turns out feasible.  Not a requirement for your change of course.

Thanks, I will look into that separately.

Tzu-Ching
