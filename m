Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795528760;
	b=eXNRwN9xvsaEU/a5Fj2XGg6yRcgTLtVysjczyu/yzthPbhtZQG8Zv4nZccCC/9unUome
	 zwZdC7Ql/94DvWCMEcbZpyfzHGPfQZ7LCMPFSM/oy/4lc2P2Iz3ajHDBubqDOUDyR0C79
	 QWuhV6kkUS65qpk99xK99M/D3Z7qpUd55svFBA+H29JsOwq04bei6aqJhhwlwB4wF8J+U
	 p+zu4HIGKgWuODp1yzy3lARRDqrB1ru84IM+hfFoeTO0/JLU9L9k3/dgYFnorWtfoUEFW
	 GJqaQ1TH4aKVfrLDJs7XOha+kv+iCmzxbKlLgwFNgyrwM6nRHTfbVnBXCmtyUIvPz6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795528760;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=A3B9SHbkg4CZWm8wkavxTHR67/yF+kGgAeL/quNdhj4=;
	b=Irco68JuqFlOSu66RLptd3EfQEgO7QPndXbC4d1IwOsQ5E+mnYNzPL2F796KqRcvO47C
	 YrlaS4+jH7CiEEDs5Wb8brd8x6mCIDbkSrmPXvVuj/VvBwRVzksuqwdn2EaJ8Xi5MJEhT
	 uybE9q+kxIP8jVeRxrf0Ht4r2NXKIrfWnCJzvlM7M5zZqNjZhShWivjcrC6Edncd+ZChz
	 CF5fBcL/RU747XWPyiqHdDkdsg4IFGXnLog3dsQDy7p4uh8BLMo8c7a4bXnO7vAb6k9mq
	 fpM/JQyFALW3jYe/IHTfPsaaOKNoGd6C3eNohX0a7ZKju2mR4gpdyf456ZoK3l87VjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cjon4Ucj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IN7Q9iD+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E36A606A332
	for <linux-mips@vger.kernel.org>; Tue, 24 Nov 2026 13:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E36A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cjon4Ucj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IN7Q9iD+
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuSQc120206
	for <linux-mips@vger.kernel.org>; Tue, 24 Nov 2026 13:59:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A3B9SHbkg4CZWm8wkavxTHR67/yF+kGgAeL/quNdhj4=; b=cjon4UcjWcOCiCM8
	gWnrwDsiwp8zzMGkWAJPa9keZO2UKCWvdPbBRjeXwrgILeg8A0E6yZL/f9eCqQJy
	O96ohgLQVhZoEIEGGSYendAY0kAs4E/AMMnW7bUQvgm6QHQwOBM5GYlpnMNBqIpb
	G0+KKhKO6HwZ9cJ6SstBm1mVACHgb7ITZaNm349eAUITvyDoOK2Vhts2i71NShzZ
	aTsFDdMyLx5KEmJUoQnOJeHpgXB5N7GQrcGeLfGns3+3ypy6i0l80fMK6zj/XH4v
	ZmAfEaXUVS7MnftLthxU7ZN2TGHLRlWLMZsQMYPU16dT6qFU53GTsRU5/hGoAumG
	Y+fjhQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4x8f3f9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Tue, 24 Nov 2026 13:59:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94961ed97d6so805628185a.1
        for <linux-mips@vger.kernel.org>; Tue, 24 Nov 2026 05:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795528757; x=1796133557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A3B9SHbkg4CZWm8wkavxTHR67/yF+kGgAeL/quNdhj4=;
        b=IN7Q9iD+O4F/PJc2it92D9/IjlQdp6EwM5TEPIVGAQp/v8AEcn9kZyUR/VAhDLneHt
         pdzxCFGP/NAzkGdU1isqrDhHoOxMk2h8qpS78rlgoYO8IUehw5J2N+iaPuMU3eNwEWzI
         a8o/dWwAUN6BpOZOyDZ9PvKU4PUHMoWWAy2GSsX7k1bH3Atyi61hOxt7zbzqvV1hPNy+
         zOeTFRl9M/nygxps3bdprTPVsKW1OPP619EBYe/xe+2nwlmlibFlTVrVKjCqImiYtRxa
         1nG+ztXgG/QZ660Qq3uMBEz8998p76BroN1nAbKGxFgF7/D0rdWigxIMQieNNoE9l535
         ii6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795528757; x=1796133557;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A3B9SHbkg4CZWm8wkavxTHR67/yF+kGgAeL/quNdhj4=;
        b=tbbVhOy3NywyTq9A2btzO1mtC2NP4vKgMuUwrZdqk0PUSb42RqY1VkbaKFNwNJGwW0
         6W+u8gk54PtmVeeC985V/8yXSz9EsGNAn5EBnZVlSKNhb9RVNGcjCKaLrDzi08grWkUu
         ixnHE1dcmJ8kiBJNLitN6QLyZDER+kNZmY80PcbO0NfRf01eQKJQ8kKn4glG7nLJ9L6z
         6rLCDaEknvgMyX/dM+ILyxBQpMZmSLCfkAVj6bHo5L0QkgyXOK7GWB410qUE5RMAMZbL
         T9lrKHGvWRXXeXUkoZSqmdtOltlNIAyL5rSAx7YS+qnrr47CEMWAiqQLVu1tINk5xH7h
         4uRA==
X-Forwarded-Encrypted: i=1; AL+hErG25QMxRi90V/8K4fZH5UujrNJ/YPl2qSmsjHx6JoCn0gYibpd/CVVCBjw/aqdlavTu4vXHT3fwtwSj@vger.kernel.org
X-Gm-Message-State: APuU4Z97i8HAJAL5vIbTB8UAfd1luEreWbmKHws3w4um89cGdovIrI3K
	GNq5bwPNrL/wVzXCG8ZrlLM1xatxeTocKDXtqbtA60OcZbk0ZQ8Vkak1425uv7Q7EQp5w6+iM4O
	QO4AGZXeUFgold2rP1O7s2o+Zygy7IQFA5TjejtVvkcRKQwnoN7J0f+JNxto1Rzm5
X-Gm-Gg: AZFdTZf/bmPBZZVHvDt3EXejN6W9T3NyDzjfDh23ZGCYmEbnH8Ga8CZD2/9yGsjdBjU
	YrvLacbzACkdZTZwPkfV5QSkFnn8sklm4eyespsqqpC6nMibzIaWy7YioSFYbiuUJgdO22ysKIO
	hj7Z5M6p/fg0GTDrv4n6yHSm6oBZeaaXVRJW6HcydPdO1Ra0lOL9FZl6xqYwWKlZ91y3090CN52
	7tiaHuexks1jFJi3xZp3ktVUvbPNHPABm4U/9RrkcLeY0lv/Ibcxkn5g3kwEm6xyDki/RCIpMnt
	BUGJuBo07VzMiAxNoLA+MNWjH8r2AJF97xVLVZvLsLz8yhMIMV5GMGbOnVwY2jwJ1TzTOVhRFRT
	nUrH/TFao0Ku8WdOyi/ykiIzBTPLeZHNkbljxoilW7ke5SXS6zQaF38OiEwvTdPy6JSmd0MXDWy
	YOfYVGVTGn2+EsKVIWPEzdEBcYb2ejbwVJIr1SR1s2F5fvfi2QNGdhbsf40FHKDA==
X-Received: by 2002:a05:620a:1b82:b0:946:1dc:a276 with SMTP id af79cd13be357-949b35ac8d5mr2739758385a.18.1795528757566;
        Tue, 24 Nov 2026 05:59:17 -0800 (PST)
X-Received: by 2002:a05:620a:1b82:b0:946:1dc:a276 with SMTP id af79cd13be357-949b35ac8d5mr2739752885a.18.1795528757012;
        Tue, 24 Nov 2026 05:59:17 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm28945865f8f.48.2026.11.24.05.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:59:16 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Kent Gibson <warthog618@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-wireless@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2 v8] gpiolib: finish the legacy cleanup
Date: Tue, 24 Nov 2026 14:59:13 +0100
Message-ID: <179552875131.26219.14927804757047791549.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123085723.156933-1-arnd@kernel.org>
References: <20261123085723.156933-1-arnd@kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NCBTYWx0ZWRfX8t+UijQLX1H5
 a0oNNunJvCHG/MslgdOoj77gqwUIjsey4rMzc4+lDuIWb8IrhSi8OaRCIQgEs+sjW4h0FLLrJO6
 24E2gRpjqY88X/fqVDdHx1YM0emgu0U=
X-Authority-Analysis: v=2.4 cv=JbgpPkKV c=1 sm=1 tr=0 ts=6b059836 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5VOqrEiZFYvkFkybF-sA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: RZcYZKGSDhk7V04Ty2LcMF-7y0WojQ7B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NCBTYWx0ZWRfX/8EXn7CUlqdw
 YKroCiHCoOXYo9PRQmI31OLV7ewKrCGqVV8LwLfvjBWNBiBMyxBUNLAM6CIQQrb2DeHJHdvW6hR
 QAsZ+Pbs5+s5eVchzd/1LEBZgoVLfEoBbETg3br5PMq7l4QWKDuKt0MXThSHMwIceFL0AkrnCtz
 icjQwqG9lIgwC6FRoXx3QZkUxdZgMv0LYa39+0TKUBelurzXYLa5Jdpf5DuITYWtQP4s+VQvhHG
 UbclDz8qpB9otxNC1M9Qtvp+pyNXdk9OnbHZM3VqsriA/xW6XAAhrlj3/4X0ogNd1VbqbebutMl
 K15fo/wYvGj/xW6Ai+CfgEXkqU/epQK1pGl7p/TRHJAuQCGrjkKMD4sqoAJI9WJRuBtWjclwFo1
 WOFkZOJn4o+xEs0X/vTlLX+wfYfA8jcHfIXeX3EdQHrOHq8f6Bp/cXKHsB5ZGW8EBjPnc/TFGJj
 EPxrDVVwbnWnOrvN3jQ==
X-Proofpoint-ORIG-GUID: RZcYZKGSDhk7V04Ty2LcMF-7y0WojQ7B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240054


On Mon, 23 Nov 2026 09:57:21 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> These two patches are left from my cleanup series, finishing off the
> work to turn off CONFIG_GPIOLIB_LEGACY by default, and removing the
> include/linux/gpio.h header.
> 
> This was planned for 7.3 originally[1], but kept conflicting with
> ongoing cleanups for the broken rsk7203 board. I've skipped the
> oneline rsk change now, which will be fixed properly by Dmitry's
> patch [2].
> 
> [...]

Applied, thanks!

[1/2] gpiolib: turn off legacy interface by default
      https://git.kernel.org/brgl/c/b52fb554b36ba37f86a591d0d27dc45fc5628920

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
