Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795694877;
	b=QsX8plPGSpArmV48cdDprK12TVxN2kM8ggZDFP+ZUayplXsLhO3//Y2mEMgLNR+iGKzn
	 3PTmsDLy6cMfsx+rXlH8aYrG93kxSaQ4lMEDC3HHFFDDNUbzB/5DLu/UxOgBSrC7lGQbe
	 YuaYi0S/4T212ixOgiw+GNLyj+jA2ocV99RlRItAsUh8HYkA4ScB+J++3xc3Fcj3evSOi
	 90QDpa6QaDWDQIALuXhOqHqEbGUFM4zei8zO9cJW7HRXLKc11LhDtDv3rh0HLLjlVJR0f
	 0x8i5mAq0v4+9RKZgKtHjJ5JyAdzQdeW6k5C6kYd9n9Nm65fCsq+2BtrapxGwxQHELg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795694877;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:Content-Language:To:Cc:
	 References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=A3q050iHXl2uljnJ9EBqvANPMdW7AqYe9vsOPw0hyoc=;
	b=iJfH+fKMg0MQwCujq98/43EXA0kyp7Yp7wa7CE8nK/ltx3sNKplPUpIMzXmU5YeKF1E3
	 qPLOQgDWCTXXzfq42hLpPBrHKshpWA9MFwq/zW0nELxZcd807zFhp4tRkeETF4xB1CXb4
	 0azgKd8AlOUJp4UwkyxvkdAxhj3PhaKz6vC0xSKeiNnv4JSisU/+L32dJ7A0zQly+yWgc
	 L1o4sHs558EXBuilUU2yUrvT9M5L77rkzPX7VUCaji0WNQkA786RuEThDT7AGhSn7EITk
	 F3HSYp3zsePPBypuq1xUNggtYZLS0nBkXpwyDPPkclQsNC02ZaXH7c+RrycP0X/HBDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QdaarOIZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fIYHKpB3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6DB606A321
	for <linux-mips@vger.kernel.org>; Thu, 26 Nov 2026 12:07:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D6DB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QdaarOIZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fIYHKpB3
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVQVt2758191
	for <linux-mips@vger.kernel.org>; Thu, 26 Nov 2026 12:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A3q050iHXl2uljnJ9EBqvANPMdW7AqYe9vsOPw0hyoc=; b=QdaarOIZ/V+H/5HE
	iHbHmHQiw6z2hlwoipVXy3wvjuWv2EzlD+fa4lEyKtWsbnvmngtTq7hqwvH0FlLc
	F0wyIy8ARt//dLNTF87+U1ZOfUUhQDMbENqK9JlFeRDvipwWnpUdp9ljy1UucwU6
	DzPlxAgjWIodWZtdyaBCRWHyCSzWHhV3MfPqJBegFoq8nLmFnBKEr+8UQKHWGGR/
	FV0mMnr1e0WbxvO39K9GDRMJnPHHVY+S1EUEvo+EzsuqtkhcpNP0JqXs/c5e7x4p
	NPQDmFSeAXozgLsk+nx1CRTRQfxsccGIoo/do/0FYoYk6p1264iVkZIxBN5tswHQ
	Eqy4wQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahvb99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Thu, 26 Nov 2026 12:07:55 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-990aa76e3daso1272534241.1
        for <linux-mips@vger.kernel.org>; Thu, 26 Nov 2026 04:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795694874; x=1796299674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A3q050iHXl2uljnJ9EBqvANPMdW7AqYe9vsOPw0hyoc=;
        b=fIYHKpB3k7yudOuXTJBf7qb8lHGfytmJEPfztYTHlnev/k4MOHXXaV204FSxyIQEu0
         efLlniT0dDoHJxP+eEd96/e4t15/nHImWFCQC77uQTHksbGlCAg1OPPRv9DSi4o65UpX
         qZcUb2HfNXbiv5Y40n4sFpgtChnQXRhFnt40IloRfqzp4rK3e+xY/nOteS6PR9+YgAdg
         amMKD7uY61/qN70F3GzGoCn//VZCRjfQNtMUAlFk/7FsWAtbu46p4262vIvfKBIjS40G
         OE1Oz5Gwmy2/n/Hh6JRwAgQqqOM0zObD0/SJbMMjrbXigYumHepbbN+Ro1maAEu6fY2V
         Gksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795694874; x=1796299674;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A3q050iHXl2uljnJ9EBqvANPMdW7AqYe9vsOPw0hyoc=;
        b=udjkLPsw4brA6W3Dx6o4sd0Xx7lok74vVTjHC98cxUTzn/4/0u40JQOysEdF4qli7B
         Uc1s6if2AiHoGUay8UOQ2Si/zopIl3KcakAGrKhHSwLspX0EYFcxmVF63vWhmwRR2JX3
         P6ZHWwY22Q9yl1+Y45sjxVWkHsDzIb+qdYmnSh8sIZ2I4Yh55VcSp2dNuCXUVYr0YYXE
         01eGejdkFqheZLS8FsSMlc4pfriyADflRIz+hHy/JE+ZwsAOWLrvWA+6qHDl6WXD9XQu
         6bm8zSMX9bDtBP0AiagXYaGQ07zB9gxJIIUhshRGV9rVKey/Hi7rRlyLAGBgf/vfdmuL
         lGZg==
X-Forwarded-Encrypted: i=1; AL+hErEAUii+KKUPkI0pvWT3+k/DvMuHaf2FhLYsKXLXcGZwighuuMQS7X23pGXfnSO5db51KZK5L56FJOWd@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZFNdMEfNiaNk8hp0B16qcQcBYCIqYZdxroMOv03v/GsqEAUDv
	ionmjPJwf1aLOf1pecpLs5boO4/Uab6Ga3F/mYIWENd40M76ayLyTLaMx0TCQuo6NHQ8ZbDsUBF
	zgh+IlV3ngPxeQ/p2lBwEB5YAnCWDOHQgQujNwlrCtKZINd2zusnzswa39vrjtlNGnZrtiMNeCw
	E=
X-Gm-Gg: AZFdTZcCkwDtU/YULrGZoSIlD3lEBJpehZX9/d/W5TIWOrM4xlCxb5J0cdwUbDQCbCS
	ZzLSeq6zrlnqWZd0OgCilnmZGFQ8vtsrEqrz2p4UUTTr3TCWzeRraRJBc+4FA4u1itSJ+bROZjf
	Vi14PqTE7TNHrQ1HEMj5gRpa8J60bSWFZ7hyv2Gs/nc+wDEmEXePq5a/yrjcd+trv3uAX2mjjbV
	79WTqsXHdlmBSZU5/XUlYmSliE4orZcDBdqWPME/W+GBILq7Vtv0ugd8cWn1ahFLfoxTW/Yqeeo
	UE+B0egriVrsIL/Z6kmizmAZs96Xel1ThPNxMPaLYUbjGlPfIbeJtBKuqK0kans46TUPGXkDceO
	vBmKrjpzg+5MNzNDR2FpWKN69hQJ8X4tgHcnS49b01jcgHlSkfUwoWCyAAODqQuFZlF9gtrZhzY
	DhS44IJfQ=
X-Received: by 2002:a05:6122:4307:b0:5e7:e3f9:1322 with SMTP id 71dfb90a1353d-5ee8aedd40dmr11539714e0c.9.1795694874070;
        Thu, 26 Nov 2026 04:07:54 -0800 (PST)
X-Received: by 2002:a05:6122:4307:b0:5e7:e3f9:1322 with SMTP id 71dfb90a1353d-5ee8aedd40dmr11539686e0c.9.1795694873509;
        Thu, 26 Nov 2026 04:07:53 -0800 (PST)
Received: from [192.168.69.202] (pmd666.hd.free.fr. [82.67.153.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm334248955e9.0.2026.11.26.04.07.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 04:07:52 -0800 (PST)
Message-ID: <5470d213-8d35-4032-a379-41bc67a36204@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 13:07:51 +0100
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mips: txx9: drop linux/gpio.h inclusion
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Linus Walleij <linusw@kernel.org>,
        Geert Uytterhoeven
 <geert@linux-m68k.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-mips@vger.kernel.org
References: <20261124143432.3234864-1-arnd@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261124143432.3234864-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: r468LO3voE3wt_TcyqR2yoJo0maYUspQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NyBTYWx0ZWRfX9fGhTl/xkGka
 iU6u8Rht2lUK6kuPvfAmzD2kQVbvX0NnGkeWgh8e/81eTo+VEz04OuJ3BxsEnLyyZCglnfPFb/d
 hSqaU2xOpreHYeIJjBiTDxerEhsWlqQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NyBTYWx0ZWRfX8jNn9d4N6lop
 NEtJkB99ZH+TtnUEMzBryvsuY/huKVKAf1mUUDmUlgS7/El7O24Wf36geTOFlCZUZ758DaccPnE
 1H8B2QrcXWjmf3kz6OceU/kaVwcKudq0/i5SJI6AKumtlZqlvZ+po/cldqavpMHyP7y6wIhqWWZ
 6qh4jhLC2UIF0WOZLYr/LKY8euje+dg7yqSUgSbAkBMza6rwy5Z7o6tZP5zNlRKoTzbbfVOQJlz
 VoWUok3BB+OoUXMVoPlDZCToFiwP3JgWRiP78VsVDXMzlXYq+O5yls0HFApv0ZqytJR2BxL9qeE
 5hvtoRqGzHWgBLYuahEckHgmIr4LkV2f+GpqnONzE8z00LYAr0TxJWccySCi+6td8t83+4Id/la
 PNjBX2Cu86GWHWdDPLXnt8ecefGS5H2Ql5ouZA6+lKa3zV+9tqenpiF2qya328VSwI6grVBB1E6
 eShMvhXBviogIVGAY0w==
X-Proofpoint-ORIG-GUID: r468LO3voE3wt_TcyqR2yoJo0maYUspQ
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b08211b cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=C_RM2_6QRAeI3cZdMXsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260047

On 24/11/26 15:34, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This header is going away soon, so include the appropriate one instead.
> The legacy interface is no longer needed since the conversion to a
> lookup table, but the consumer interface is still used.
> 
> Fixes: 0caeacb11691 ("MIPS: TXX9: rbtx4927: Use GPIO lookup table for SIO DTR")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> --
> This was previously part of the patch to remove the header,
> but we ended up splitting that up again.
> ---
>   arch/mips/txx9/rbtx4927/setup.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
