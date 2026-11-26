Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672414;
	b=yk+bCqyKQLqkzo5oj0iboBdMAHCG99S/C5x3oh21j4PfTvDFFiwbdVxv88uIIqtjxvjm
	 +G2fgws+yE8X8MoFSXjOgIQf6sYDd0HpHhL9oGg9Q7ZseHafZ/HVjhFSXW9zOuiQ0SnTZ
	 xZWDeXXmdSw+mCzQ+Em4NvHudoJiweFeH7lTo354ep4sPSRNG531N/gy+DS396jOY5AiB
	 Jsbu/diUPeVLcbxD9lSCOt4MD0znWtDlp1KDYPV62Plm0OgKVO3+by58QRk4O/HxzFBJh
	 pQQVdXKynGGZrL/X5TslVvUKdN4aLcdn9nu2DPMj8T0WbKryZBqGGnxjD4pc4aI+fFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672414;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RNFx/EgbmUa2oSZLcgIiIgG0cChruBrBpYoE7jjVeQA=;
	b=d5lL7IoeZvYXS2wk3tBOnOXK4oSRYUpPsg+oZuuC6xfUf3u4mIbgfukbeLrBfzzGx/5I
	 u9SY980dsf1frkdBkF2oJe0VZ2MLrqZImoVxGhDOazr1BFowqQNaPMq93vKZTjm4cRoi9
	 L7rXkIEujIbStZn1FzU6wju0Eb01+KS3+xIYJ1UToKK6qviSUngQ3v5YWWLZ4CZ0inbp9
	 Htf71VpwFQGDO/1fqJiuFT/hfKOvBZtlrDn5N2AlHlnyqwk4XUotVg//m1A0KYdRkorUm
	 pk9iJs7oIgt8ZRZC3EVf3bebWxRRtRnpsCAuoYBEWiufmNFc+YX0eQlnWaqq1eSyxrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fjNH1fxB;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A7B606A323
	for <linux-mips@vger.kernel.org>; Thu, 26 Nov 2026 05:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3A7B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fjNH1fxB
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2f037bc348dso53905905ad.0
        for <linux-mips@vger.kernel.org>; Wed, 25 Nov 2026 21:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795672413; x=1796277213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RNFx/EgbmUa2oSZLcgIiIgG0cChruBrBpYoE7jjVeQA=;
        b=fjNH1fxByJRym/yf6ls5GpEmg7EM/q27j1sDep3Ij08UDsi73ei6cvbz9AQ8wLeMy2
         twljquQKAa8SOKpMZu3DEd0FGum8h8U4+Rq95epZvesb1Qzj5MbDGiLjv5A4+4TAOT04
         a/uYZGt6S/x0IyuF6X/XWD7Ta86DY1g32dQ1D01jQMFS5mUdVicHHwZZuqmWycx1wwmx
         Hjj6vN41rBOG9UqTKaVxXdhzHwcbyQKILRiERhMmEp/rE8pMWyM6Vz9ujOnRIINHAYpp
         PKcxmevPwpAkApxVx+uNlF5w7qIrOeS4f7WEXGdQyaI4ZO6Hj00Z5/zTak8toNeZwyVq
         fWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795672413; x=1796277213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RNFx/EgbmUa2oSZLcgIiIgG0cChruBrBpYoE7jjVeQA=;
        b=E8v/B/OjLBeqoaGY4wS26H6jU33J7+iU5KUWjf1T9vg2jWaL9AB24jEm9gjLcPoFKL
         6w/1Ve09omrYkYVSF0o6TP4Zg8mbkSVHk+UFQTfJ/NaYLK+nOZDxaKCpjlut995EYMc8
         H8fbAlIhhEG0L/05HpTtEP3svEZ+nlXxERUO+UyKjVbevc9Tl0w+7qELnxquB2vzXXKJ
         s+/r4WwbjzNywymPJ84uIsaqahMI90lXFvqqdMNKTEf3EtkxYAjgLVyOGyvXKzxVBI/C
         7KUkAsC4NFa40w49DAZPXlW1gbvFwU3pKVlWKVSWRhen1/0ng7dedjV9Yv/+tzRpYKFy
         xNCA==
X-Forwarded-Encrypted: i=1; AL+hErEFMLvhhfxjmgWVXq6bjwayaCKBdgIfjLDFwkzFlsXE7Cg4ZHUnV1D96HJeUHMKxdMKGOcBMe/Nq4M5@vger.kernel.org
X-Gm-Message-State: APuU4Z+WzxWKFtEDsO5jHVsvTERfg2P2Fac7s5+LC/slml0s74xeljXI
	1AW2TfiXGh9V7kQDNGHfCPpWOVrnpaF/u33JtOEwabXPyIPCZk7OCKqC
X-Gm-Gg: AZFdTZdOBVqvjoEuHrTwe5nQ65K2b5rC0xaXIRs08dWkrMk1kWPG8ZnuISbGtW7YFPb
	/9p0y+11tHGfFVOAWZvga2kEtGddYd8LtidooorjbubDnC/QoMufLLdxXxIGLRpHLLSzoGO2IpI
	K/kQHQ0tsrB8MsoeLCmSd1Wnew+guR68iyVqRFV59HwNbwdIxlryAfQ+u0ibWbl/ev1tzgEZM8l
	QmHjD2LIh3tddwJu6YBuZhr6HMR7NhPo+6lBOvPgt0Jl3tyw1AF5INHeXwflDrqK+fuqwMKZ/2y
	j23/8R4TmkD45alKjEI+clr9geHLiXVNHXG5QzIYMc2sR7T9LRqgri4LeMAt1N3nwULgLdfu8V1
	v5HSsI13Ku2bZuwjmxp+02YIwliYXsne1Do0XPR0lKPV/yXjb4cyMNRYy/mjHJlJ5Bu1yEp2OkO
	V0579NHke4v0aiV3bN271pccrPNJTP2QMj+V5tecRJpsZA5d2RKHVBgUTN2p9XQLlbgGJR0cQJw
	fTbDZvMRm9V2PrQ7Bm7xcKtGFQcNnd47mypBddXE8aati2RAS4CniH+jXML8rsYt1c3j1WLGDy7
	HRPNFz05KIEsCLnzzsBxcIOYc53/MRUPf4d6AGStAxPLZbZqT/k4fSQ=
X-Received: by 2002:a17:902:ef49:b0:2ea:192a:13b8 with SMTP id d9443c01a7336-2f03f1cfb70mr191222975ad.20.1795672412937;
        Wed, 25 Nov 2026 21:53:32 -0800 (PST)
Received: from arm-a100.. ([140.112.28.118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f14a432sm98478035ad.75.2026.11.25.21.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:53:32 -0800 (PST)
From: Tzu-Ching Yang <shingekinocore@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
	linux-mips@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	=?UTF-8?q?Beno=C3=AEt=20Monin?= <benoit.monin@bootlin.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2] MIPS: Make cpu_has_mips64r6 constant on 64-bit r6 kernels
Date: Thu, 26 Nov 2026 13:53:24 +0800
Message-Id: <20261126055324.3562889-1-shingekinocore@gmail.com>
X-Mailer: git-send-email 2.34.1
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

On 64-bit r6 kernels, __fls() and __ffs() never use dclz: they always
run the C binary search, 37 and 39 instructions with GCC instead of 4
and 6. __ffs() calls __fls(), which uses dclz only if cpu_has_mips64
is a compile-time constant:

	if (BITS_PER_LONG == 64 && !__builtin_constant_p(word) &&
	    __builtin_constant_p(cpu_has_mips64) && cpu_has_mips64) {

cpu_has_mips64 ORs cpu_has_mips64r1/r2/r5/r6. On r6 kernels the r1, r2
and r5 terms fold to 0, but the r6 term tests cpu_data[0].isa_level, so
64-bit r6 kernels have never used dclz here.

The r1, r2 and r6 macros were run-time tests until commit 1aeba347b3a9
("MIPS: Hardcode cpu_has_mips* where target ISA allows") made r1 and r2
constant in 2018; it kept for r6 the flag test that tells MIPS64r6 from
MIPS32r6 CPUs. Commit a2ac81c6ef40 ("mips: Fix cpu_has_mips64r1/2
activation for MIPS32 CPUs") later added cpu_has_64bits to r1 and r2,
and left r6 alone. Every other cpu_has_mips32rN and cpu_has_mips64rN
macro is a constant on the kernels built for its ISA (the 64-bit ones
for cpu_has_mips64rN); only cpu_has_mips64r6 still tests the flag at run
time on 64-bit r6 kernels.

Define cpu_has_mips64r6 like cpu_has_mips64r1, cpu_has_mips64r2 and
cpu_has_mips64r5, as cpu_has_64bits && __isa_ge_or_flag(6,
MIPS_CPU_ISA_M64R6), and remove __isa_ge_and_flag(), which has no other
user. On 64-bit r6 kernels cpu_has_mips64r6 then folds to 1.

Because __fls() and __ffs() are inlined into find_*_bit(), cpumask
iteration and ilog2(), the functions of each 64-bit r6 defconfig kernel
(64r6, 64r6el, eyeq5, eyeq6 and eyeq6lplus) are then smaller than
without this patch: in total by at least 105340 and at most 108352
bytes with GCC 16, and by at least 124340 and at most 146692 bytes with
Clang 23, depending on the defconfig (scripts/bloat-o-meter -t). In the
64r6el and eyeq6 builds, the users of cpu_has_mips64r6 other than
__fls() shrink 3 functions, by 148 to 248 bytes in each build; the rest
of the reduction comes through __fls() and __ffs(). __fls(0) now
returns ~0UL instead of 0 on 64-bit r6 kernels: the -1 that the comment
above __fls() documents, and the value on 64-bit r2 kernels.

On 32-bit r6 kernels cpu_has_mips64r6 is the run-time test of
cpu_has_64bits (isa_level & MIPS_CPU_ISA_64BIT) and gives the same
result as the test of MIPS_CPU_ISA_M64R6 that it replaces, because
set_isa() gives r6 CPUs no flag of MIPS_CPU_ISA_64BIT except
MIPS_CPU_ISA_M64R6. On pre-r6 kernels cpu_has_mips64r6 was the constant
0 and becomes a run-time test of MIPS_CPU_ISA_M64R6, as
cpu_has_mips32r6 already is a run-time test of MIPS_CPU_ISA_M32R6. With
GCC 16, the functions of 64r2el_defconfig are 264 bytes larger in total
than without this patch, and the functions of 32r2el_defconfig 3352
bytes larger (scripts/bloat-o-meter -t).

Suggested-by: Maciej W. Rozycki <macro@orcam.me.uk>
Signed-off-by: Tzu-Ching Yang <shingekinocore@gmail.com>
---
Changes in v2:
- Define cpu_has_mips64r6 as cpu_has_64bits && __isa_ge_or_flag(6,
  MIPS_CPU_ISA_M64R6) and remove __isa_ge_and_flag(), as Maciej
  asked [1]; v1 had cpu_has_64bits && MIPS_ISA_REV >= 6.
- Commit message: describe this definition and its cost on pre-r6
  kernels, in place of the reasons v1 gave against
  __isa_ge_or_flag(); add Suggested-by.

v1: https://lore.kernel.org/r/20261030140430.1857741-1-shingekinocore@gmail.com/

Function sizes of v1 and v2 relative to mips-next (bfe97f12a0a6), in
bytes of bloat-o-meter -t:

  defconfig   compiler   v1        v2
  ---------   --------   -------   -------
  64r6el      GCC 16.2   -105340   -105340
  64r6el      Clang 23   -134840   -134840
  32r6el      GCC 16.2         0         0
  32r6el      Clang 23         0         0
  64r2el      GCC 16.2         0      +264
  64r2el      Clang 23         0      +168
  32r2el      GCC 16.2         0     +3352
  32r2el      Clang 23         0     -2500

- r6 kernels: v2 gives the same vmlinux as v1, byte for byte, for
  64r6, 64r6el, eyeq5, eyeq6, eyeq6lplus, 32r6el and malta_qemu_32r6
  with GCC 16.2 and Clang 23, and for 64r6el with GCC 8.1 to 15 and
  Clang 21 and 22. With Clang 17 to 20, which cannot assemble genex.S
  on this base, v2 gives the same objects as v1 for 64r6el. So the r6
  measurements in the notes of v1 are also those of v2.
- pre-r6 kernels: v1 generates the same code as mips-next, because
  cpu_has_mips64r6 stays the constant 0. With v2, cpu_has_mips64r6 is
  a run-time test, and the function sizes change as in the table. On
  32-bit pre-r6 kernels, each check of cpu_has_mips_r6
  (cpu_has_mips32r6 | cpu_has_mips64r6) tests MIPS_CPU_ISA_M32R6 with
  mips-next and with v1; with v2 it also tests cpu_has_64bits and
  MIPS_CPU_ISA_M64R6. The -2500 of 32r2el
  with Clang 23 comes with build_clear_pref() and
  build_copy_store_pref() in arch/mips/mm/page.c no longer being
  inlined.

Testing: no 64-bit r6 hardware was available, so the kernels were
only booted under QEMU. 64r6el_defconfig on the boston machine (I6400)
and malta_defconfig on the malta machine (24Kf), built with GCC 16.2
and Clang 23, pass the ffs and bitops KUnit suites and test_bitmap
with mips-next and with v2. W=1 builds of the configs in the table,
also with GCC 8.1 for 64r6el, 32r6el and 64r2el, and of loongson3,
cavium_octeon, malta and ip27 with GCC 16.2, show no new warning
against mips-next. A run of the ffs and bitops KUnit suites and
find_bit_benchmark on an EyeQ or Boston board, before and after, would
be welcome.

Base: the mips-next branch of mips/linux.git at bfe97f12a0a6; the
patch also applies to the mips-next head dfe3ece66313.

[1] https://lore.kernel.org/r/alpine.DEB.2.21.2610301515350.42255@angie.orcam.me.uk/

 arch/mips/include/asm/cpu-features.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/cpu-features.h
index 3f11e5218e6c..301158e704d0 100644
--- a/arch/mips/include/asm/cpu-features.h
+++ b/arch/mips/include/asm/cpu-features.h
@@ -57,7 +57,6 @@
  * Similarly allow for ISA level checks that take into account knowledge of the
  * ISA targeted by the kernel build, provided by MIPS_ISA_REV.
  */
-#define __isa_ge_and_flag(isa, flag)	((MIPS_ISA_REV >= (isa)) && __isa(flag))
 #define __isa_ge_or_flag(isa, flag)	((MIPS_ISA_REV >= (isa)) || __isa(flag))
 #define __isa_lt_and_flag(isa, flag)	((MIPS_ISA_REV < (isa)) && __isa(flag))
 #define __isa_range(ge, lt) \
@@ -317,7 +316,8 @@
 				 __isa_range_or_flag(5, 6, MIPS_CPU_ISA_M64R5))
 #endif
 #ifndef cpu_has_mips64r6
-# define cpu_has_mips64r6	__isa_ge_and_flag(6, MIPS_CPU_ISA_M64R6)
+# define cpu_has_mips64r6	(cpu_has_64bits && \
+				 __isa_ge_or_flag(6, MIPS_CPU_ISA_M64R6))
 #endif
 
 /*

base-commit: bfe97f12a0a64c3682be21a02404238e3b91e945
-- 
2.34.1

