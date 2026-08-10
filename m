Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64BC356760
	for <linux-mips@vger.kernel.org>; Mon, 10 Aug 2026 03:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786332296; cv=none; b=Kv1EYOSRvwy+f7z+vMUt831IuypKLM1y1DSfLzoXtCGk6Lus0SEq5HSztHHU4g7+SAHbBeMdXtiCi+4s0yJmrKiBlOrcGHMSPEIU+ZUI4xJtJyd8UXfdZBqUUxDOdU7Cv+O373Lja4LImmTWryb1WE6pjKKo/zW/ba1AFlsOhdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786332296; c=relaxed/simple;
	bh=k2gpzuaHFHvUkP6+R/iRr0qmzmZZ0pqh4vwCvq/iJiU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gk5UqY9X3em5E1fzJ/LQb9NKmQKg5WU1XxxS9+h1Qjn6ZjD1xO/iY3+TNk6V1F90r8JYyq1/624DmZoqQI47JwU8gQN4KGbKfmvmN6b9anTOzu2y9df0WAJpzTpgVV7Poz1k8Ek96v2s+TFVftKo8H6ui58MAGlTHxrzlgAVmJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hhxQCHf7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BMbYs4mm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hhxQCHf7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BMbYs4mm"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679L7Gaj3476728
	for <linux-mips@vger.kernel.org>; Mon, 10 Aug 2026 03:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kvbFwVVBMqfv/umXyteNcSRhSoeZzKe/6uhNTUR5reQ=; b=hhxQCHf7EVaebvmp
	iHj+HlSAhrZidDdj+JanmT+LlfGNFTmrqCkG2Oil/7x+/vfzmfhgVEweBFrGPuA1
	1sD5HUbmOCDG1DyxDEKfnhxpVqHcfre/U56GjZE7vIP872hafAQFfzrqBM6mIMxQ
	VjqcQY6Kp3w6GZiQW/0tlPnM1sgWxBs6EbHF0Jsiduc32+H5qos9s9laeSbSpkKz
	jzjxiSJVK4cj7wwamYSYbAAJTNiM5WmuSNHuzfqO693no4s6EaeWgQdYmfW05U8L
	mH+hEjKr7ARLnngwQf4Z+eU8uQQUHV8V7Yzm9OZKLbJiSS2CxxviWHwz4Q1+yqLZ
	G1xk6Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fww7cv4cj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Mon, 10 Aug 2026 03:24:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93494cce712so143849085a.3
        for <linux-mips@vger.kernel.org>; Sun, 09 Aug 2026 20:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786332292; x=1786937092; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kvbFwVVBMqfv/umXyteNcSRhSoeZzKe/6uhNTUR5reQ=;
        b=BMbYs4mm1VyFY+4e4Z09BMqNsjzZYsqr2wGFNF+0gj5RKRuXQ1rXEXrH8BijAkRntN
         PSaprYffs74lLzkUTXORlgT28WtNaiaBrpyAQ2Rv4MySf5NOq2DJ7eopy5EXSysTr6hu
         jUgzcYG7IhNIUrmGxjpi/ktDVlrivKgULKQkhrE7r3qT3GeRV90QxKEKAxXlPIQYKJ09
         GdlUwL8KYs2YJuJUfssElJL3Xi2RAPM3RbWeSY88osgJbbxrYiA3WwZVMd4l3amxidc6
         3ckIFTjwyRG776Vt2sdjQgpjvGp0/z6xFBSLXM6i2thYxZ/7OQ+yXiX/4JYW88NwtFjW
         ChEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786332292; x=1786937092;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kvbFwVVBMqfv/umXyteNcSRhSoeZzKe/6uhNTUR5reQ=;
        b=Qp9JUrJfDW7FAdD59WCBlHIn5fAErUq/eFfwFKMRkFfJrN4c5Fx6eUIidAOJFrmqO2
         0J62IK/ApZwX291roAO5ptAu2ofOKsw9IxtBntzo/f+bFOKtnWBBBBqL2moTy65V/W4M
         hBQnUMZC9Rqj6izkS6NH6qY60PzTO8qHzGRt71TyzdFqoSiGQmgZbIHDJgDMtJxSdW6l
         y9WmTF5Yhts9S5LbgClMYPF4yt1H/8DeSUVLff/tghOT4d/eqpsn0+KHlRNO1ywUgdnV
         e1P2s78IY3J11IzJot0IBqc30viQ6avRJoFxcw9G9vLbCHweTwh29YXMZXP/icLi4deY
         9a6Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro5889WYiVX0VJueDyfhB0MG6VpC7z/g25/lnknNS4XuKiGLUUVTTSXgXequN56S5dx+lfNw5BcjlIp@vger.kernel.org
X-Gm-Message-State: AOJu0Yz62tCtvIMsO7Y01+OnmyuXUMQX1b7XuoERN14iLe1Iub6G4UIj
	BTPRl00i9mwQ4k5MmFbBb9ZhzLxurU6+4gxEdZ2/5D5061Libj2/RmwPgfZe1PyPbCd+PDp6tiE
	IF2C/ko8BXzHWUXO8AzTgsopA5e15vmAVNWjTynDqfj601N6CJEqv8B+zBWHdxOxh
X-Gm-Gg: AR+sD11nClyD0Tsj2iZ/5IH6Z+PvYIl6HBvO3zEdqtzQjFL99VbtKxBrySNepCqBUuo
	mvNzWCg0yYz8qaQmi2kuOQ2VxsvNTzyT3LkgG5NJpdaFtKmIugnF9uv8zlkWR5IS4i/oWdD0QSd
	OjI286+7V9+mhwsofSkKLPDAQzuWeFqGHglRAtUYEYKwVEfqBV8plzDtQOYiwIvlAXItGgJ5LwU
	jejClqyD8wREu/xboP2wpoCqX957CbCSmmJONq8ry61pAl4TvRuZdl2VFcH5WUd4ICiaZ+Yt+Sw
	wrma29rQUoCm9DY2ZbAfD+PNJm8wM6hUHgjw5760/QXwYvUi4/qJDTozyVyL/uJ3y+IQn3weXhN
	t16ni8NDv812N1GEx66VMBRYubXzR0/HEWSQ=
X-Received: by 2002:a05:622a:2b4e:b0:51c:17cd:1fd4 with SMTP id d75a77b69052e-52ce622aad1mr418905951cf.41.1786332291811;
        Sun, 09 Aug 2026 20:24:51 -0700 (PDT)
X-Received: by 2002:a05:622a:2b4e:b0:51c:17cd:1fd4 with SMTP id d75a77b69052e-52ce622aad1mr418905621cf.41.1786332291317;
        Sun, 09 Aug 2026 20:24:51 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995427a244sm376443725e9.10.2026.08.09.20.24.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 20:24:50 -0700 (PDT)
Message-ID: <8ce99afa-1162-4910-92a4-6cb2973ea977@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 05:24:48 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] fbdev: maxinefb: fix build issues
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Helge Deller <deller@gmx.de>,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
References: <20260809234810.982500-1-rdunlap@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260809234810.982500-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: s1fkoeO1pfUPfYzQleoCNX3z5SJIIZ8o
X-Proofpoint-ORIG-GUID: s1fkoeO1pfUPfYzQleoCNX3z5SJIIZ8o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAyNiBTYWx0ZWRfXwOhS75956lmg
 LIkmuhHhsn3AaYTnMx/h87uZnW7vY+Hn6ur9eJLrnTTKKnIJER8lrHKJtnfHkqLwoFBTzydcKHE
 Z3jhzmzAv7QD1FDPC6AL/JB4SVLT/DCeTMRD9Dxwup+w4y4tP93cNPiNaFh2RlBigyDndVXQRNJ
 LjpOtQXmQxB/FS2tD3OukUDlZi5JO5BLsaPjSAZS+r6j/6MYva6hgJTrmNmGA0+KKrl+5p1HqxS
 f62BM0j/p3v4VvojiFsr60XbyhxhEViSy5Nz2rlZ2yH2nmRk06xCCKSNsfkmonyDb7SrgkD0Ype
 o2lssyYgqD2UIafUvg1Nz0V5F8/C9LGOaynqvba1fByjWZp8PvXy9kchD+pBWL8Zxqi2QXtoFBr
 sDzGmqWe0o+xKiHSjQg21KBX/t12ByJG5It9txtOXABSmvd+Kwoj5L4AUcAI6FsIa0R+tN5fI03
 sYG9+Z4EWOffqKcrQ+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAyNiBTYWx0ZWRfX6ptPEmLOKyY3
 Z0VUCsky0eskQUuB4RnsMj9kZZIG4qxBMCfD3S72uSuB4LDQDMK8l6RrhNNsR5Hi78QwxujoNkm
 VONB301hLLncGcJtOmdla+hb7mNxAHE=
X-Authority-Analysis: v=2.4 cv=IPsyzAvG c=1 sm=1 tr=0 ts=6a794484 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=BcPKCTjPAAAA:8 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8
 a=GfA0_eoHWwQSGlj7o5oA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=MNXww67FyIVnWKX2fotq:22 a=1CNFftbPRP8L7MoqJWF3:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100026

Hi Randy,

On 10/8/26 01:48, Randy Dunlap wrote:
> This is all ancient source code from the beginning of git time.
> Now builds cleanly on 32-bit and 64-bit MACH_DECSTATION.
> 
> Fixes these build errors/warnings:
> 
> ../drivers/video/fbdev/maxinefb.c:64:6: warning: no previous prototype for 'maxinefb_ims332_write_register' [-Wmissing-prototypes]
>     64 | void maxinefb_ims332_write_register(int regno, register unsigned int val)
>        |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> In file included from ../drivers/video/fbdev/maxinefb.c:34:
> ../drivers/video/fbdev/maxinefb.c: In function 'maxinefb_ims332_write_register':
> ../include/video/maxinefb.h:16:41: error: implicit declaration of function 'KSEG1ADDR'; did you mean 'CKSEG1ADDR'? [-Wimplicit-function-declaration]
>     16 | #define MAXINEFB_IMS332_ADDRESS         KSEG1ADDR(0x1c140000)
>        |                                         ^~~~~~~~~
> ../drivers/video/fbdev/maxinefb.c:66:49: note: in expansion of macro 'MAXINEFB_IMS332_ADDRESS'
>     66 |         register unsigned char *regs = (char *) MAXINEFB_IMS332_ADDRESS;
>        |                                                 ^~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/video/fbdev/maxinefb.c:66:40: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>     66 |         register unsigned char *regs = (char *) MAXINEFB_IMS332_ADDRESS;
>        |                                        ^
> ../drivers/video/fbdev/maxinefb.c: At top level:
> ../drivers/video/fbdev/maxinefb.c:74:14: warning: no previous prototype for 'maxinefb_ims332_read_register' [-Wmissing-prototypes]
>     74 | unsigned int maxinefb_ims332_read_register(int regno)
>        |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/video/fbdev/maxinefb.c: At top level:
> ../drivers/video/fbdev/maxinefb.c:74:21: warning: 'maxinefb_ims332_read_register' defined but not used [-Wunused-function]
>     74 | static unsigned int maxinefb_ims332_read_register(int regno)
>        |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/video/fbdev/maxinefb.c: In function 'maxinefb_ims332_read_register':
> ../drivers/video/fbdev/maxinefb.c:76:40: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>     76 |         register unsigned char *regs = (char *) MAXINEFB_IMS332_ADDRESS;
>        |                                        ^
> ../drivers/video/fbdev/maxinefb.c: At top level:
> ../drivers/video/fbdev/maxinefb.c:114:12: warning: no previous prototype for 'maxinefb_init' [-Wmissing-prototypes]
>    114 | int __init maxinefb_init(void)
>        |            ^~~~~~~~~~~~~
> In file included from ../drivers/video/fbdev/maxinefb.c:34:
> ../drivers/video/fbdev/maxinefb.c: In function 'maxinefb_init':
> ../include/video/maxinefb.h:22:41: error: implicit declaration of function 'KSEG1ADDR'; did you mean 'CKSEG1ADDR'? [-Wimplicit-function-declaration]
>     22 | #define DS5000_xx_ONBOARD_FBMEM_START   KSEG1ADDR(0x0a000000)
>        |                                         ^~~~~~~~~
> ../drivers/video/fbdev/maxinefb.c:119:20: note: in expansion of macro 'DS5000_xx_ONBOARD_FBMEM_START'
>    119 |         fb_start = DS5000_xx_ONBOARD_FBMEM_START;
>        |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Suggested-by: "Maciej W. Rozycki" <macro@orcam.me.uk> # for s/KSEG1ADDR/CKSEG1ADDR/
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>
> Cc: Helge Deller <deller@gmx.de>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org
> 
>   drivers/video/fbdev/maxinefb.c |   17 ++---------------
>   include/video/maxinefb.h       |    4 ++--
>   2 files changed, 4 insertions(+), 17 deletions(-)
> 
> --- linux-next-20260807.orig/drivers/video/fbdev/maxinefb.c
> +++ linux-next-20260807/drivers/video/fbdev/maxinefb.c
> @@ -61,7 +61,7 @@ static struct fb_fix_screeninfo maxinefb
>   
>   /* Handle the funny Inmos RamDAC/video controller ... */
>   
> -void maxinefb_ims332_write_register(int regno, register unsigned int val)
> +static void maxinefb_ims332_write_register(int regno, register unsigned int val)
>   {
>   	register unsigned char *regs = (char *) MAXINEFB_IMS332_ADDRESS;
>   	unsigned char *wptr;
> @@ -71,19 +71,6 @@ void maxinefb_ims332_write_register(int
>   	*((volatile unsigned short *) (wptr)) = val;
>   }
>   
> -unsigned int maxinefb_ims332_read_register(int regno)
> -{
> -	register unsigned char *regs = (char *) MAXINEFB_IMS332_ADDRESS;
> -	unsigned char *rptr;
> -	register unsigned int j, k;
> -
> -	rptr = regs + 0x80000 + (regno << 4);
> -	j = *((volatile unsigned short *) rptr);
> -	k = *((volatile unsigned short *) regs);
> -
> -	return (j & 0xffff) | ((k & 0xff00) << 8);
> -}
> -
>   /* Set the palette */
>   static int maxinefb_setcolreg(unsigned regno, unsigned red, unsigned green,
>   			      unsigned blue, unsigned transp, struct fb_info *info)
> @@ -111,7 +98,7 @@ static const struct fb_ops maxinefb_ops
>   	.fb_setcolreg	= maxinefb_setcolreg,
>   };
>   
> -int __init maxinefb_init(void)
> +static int __init maxinefb_init(void)
>   {
>   	unsigned long fboff;
>   	unsigned long fb_start;
> --- linux-next-20260807.orig/include/video/maxinefb.h
> +++ linux-next-20260807/include/video/maxinefb.h
> @@ -13,13 +13,13 @@
>   /*
>    * IMS332 video controller register base address
>    */
> -#define MAXINEFB_IMS332_ADDRESS		KSEG1ADDR(0x1c140000)
> +#define MAXINEFB_IMS332_ADDRESS		CKSEG1ADDR(0x1c140000)
>   
>   /*
>    * Begin of DECstation 5000/xx onboard framebuffer memory, default resolution
>    * is 1024x768x8
>    */
> -#define DS5000_xx_ONBOARD_FBMEM_START	KSEG1ADDR(0x0a000000)
> +#define DS5000_xx_ONBOARD_FBMEM_START	CKSEG1ADDR(0x0a000000)

The change looks correct, but clearly this has never been tested
on a 64-bit DECstation, so I'm not sure having this code being
now built is an improvement.

What about:

-- >8 --
diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index ac9ac4287c6a..ff17afe6b8b3 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -1436,7 +1436,7 @@ config FB_PMAGB_B

  config FB_MAXINE
         bool "Maxine (Personal DECstation) onboard framebuffer support"
-       depends on (FB = y) && MACH_DECSTATION
+       depends on (FB = y) && MACH_DECSTATION && 32BIT
         select FB_IOMEM_HELPERS
         help
           Support for the onboard framebuffer (1024x768x8) in the Personal
---

?

Regards,

Phil.
