Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A141502573
	for <linux-mips@vger.kernel.org>; Fri, 18 Sep 2026 14:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789740461; cv=none; b=ib+QYnJQ1DmihwmOgCYm8DaNcmUPQZ3BB99WuQWQCrIyIQ+cNCLKObHUPWswA2orXRDLvIUMslqGC1fmkkT8DoDUpXzi97yoAil9KNVpO6WLB2JbVPnoed2TaHZxW+okDjUrhrxFJB5FGp74P51L1W+QE1GcyNQBOgykdkDb34Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789740461; c=relaxed/simple;
	bh=3f7P41kZuJLz/72fPf813J7c5MZjKD7bctr36hQLj/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aGnf26c58YnOUVvuSAoOzjTfrJs1AKvIiF3ikqmnLnsfwVF/6lWgqfiNaHDZI34htI33Pt6AAbpTFlvcFR4923/CB/UG4LPmBZHXlRmTfRQEeamcf3y6D6kIkEHf/2f1zlp3ApWqEwGFL9H7A9Wvr7fJ1tUc5ZU5LJsNZUGSEmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WMOQPdXU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zb9WHzCR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WMOQPdXU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zb9WHzCR"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOPew1711258
	for <linux-mips@vger.kernel.org>; Fri, 18 Sep 2026 14:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WoRk/8yWkpKqL8CHZGOuAy5VV6tTJ5O+1xBRTJDGdmk=; b=WMOQPdXUV75fMI5a
	/FKBNIVXm/duznxKIXaK/+/2ZYn6PGbDtcoV/Vf0zQUV5WMdOoNufFuv/PyCfRPk
	ECUEabzSJOuUDmHIUaGwW9kNT6JXqWOZqJ6FYS7M5ETYrxcC/tjh6jVUuUxxJ5HC
	guH+iK3QNWDuy0B1IEXxO9ALflg5eDUmXD0Wk3KcUPosGL8NVE6fm9DCsPxeP07T
	BlCDvUf5aFCk1eQ1WoRJJarxOfUjmi2L0aYHKwS45Lp8wUfRe8tlfmUx3YMFr/ip
	0xpqb8sjNzHfIlRzXogjMNQ5N0q4rItiaHixaW8vJuJzzZBYqgKLftZ0F4ffkWvA
	zE215A==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrg43gph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Fri, 18 Sep 2026 14:07:38 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97caca2faacso23407241.2
        for <linux-mips@vger.kernel.org>; Fri, 18 Sep 2026 07:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789740452; x=1790345252; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WoRk/8yWkpKqL8CHZGOuAy5VV6tTJ5O+1xBRTJDGdmk=;
        b=Zb9WHzCRUVWA7QIyguNuwvptvzfMO+Le773mSTbFVUyTc0+sC1aiDw3wlLK8JzcEdX
         ytt+ySpfnW5b7EGtGmf3dNHqIW6JLJNKy91I8BX9WoeHrV/95Lh+/KXaG2gVgsTWRD8k
         rHjLqjrraUwJ3yIqDww4KUWyBv2yV6qKDIgy9o+UYvk+v0EqZr0yWLF1uMg1Ubz3x6Z6
         E1c7D2pk+ZwHT6OU1o5mDv4P46TYzNRZ2dyjBbLftKQTFsAGFCpUz5a55ncmfzDSEPl6
         UM6MtmEI/OBUuKyD9REbjYO8DQezXGi8bolFYrynUYe7WvWdG3iTzgJ6OFm1CaAjVTUS
         /mIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789740452; x=1790345252;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WoRk/8yWkpKqL8CHZGOuAy5VV6tTJ5O+1xBRTJDGdmk=;
        b=KHBRuAewoxBaU2Bm/mMDgicaLsABEd/FPJp53MEO1kF6jOndPk3dE+cRa7+Xenw2UA
         Df5wXrN0G2StezC0h3qNx8rSOE9y4YbZAjKMI6IR8Xo22QPHLScqSLHO98K/mUOOSbpy
         3QnwH+0Wrw2GDa38zETmeTCyRaoxEwCAv3pOtGWhKFc9R470v/Mzrqg0O9GrnGsBgg2p
         sS/hTgY1BQD88AF/YFPDJOQuzBMxGYU17vQoE4wWKnZ7C2Nli6VL9J9B1aLXOttdvz++
         4Pb3CjvEPf+55i28vP3m5LQuW1iwrAfq2YW8u2SQBe342IFOEXNjSPOFyxyY5yO6pV4x
         SvWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxP0TrTI0tKyR0wx+v9HLrDbYjlz/U1gvlFDOxFQKcLmYsVbP4VNh8P+kVI/JX0toEtPMolqomxDo4g@vger.kernel.org
X-Gm-Message-State: AFuF++nblKFcg379dUl/7Y+Rzwn/8HSsDPdAcfbcXX+eHZlFhZ60IPpb
	ea54hFScvvJGGpNcF7vjDnm8BnVUQD09Y5hcxbu8Wvc+ry2MD0HYic4xazvm5uxkwcxIUlCs0mS
	tX20c2gxK+ywSllGkNu0f56euPYjD+uM0vsiXodk2lTFb5O9WIaS87+AMYV/BxYi5
X-Gm-Gg: AYBFou1IWggthAI+vUkJO0+drsqjfiGUPnEL5GSnrJJVaTlFz4P7Mly8oMZkwLZEkuk
	J91rmNtilR0NALUuXRu+CyokOpKjMPnoKZJLS7w4q60MrIus9L6MUcNPsy1B6D8VbDFpVh/Ll3V
	nLu/A79Ahpc5rikN56siPjUiPBRdc2t2vLWySelYND3rekw+Zyjpwzuha7E3k+TeJbVtlBz2D6g
	4W3EZPb8iGJvG9NAWc21kg11hsChOHnp4aCMgbPr0jJXrmnWmaqZWvPROWYrpfCASWd1nBEK6wR
	9InIXI1ofuvULmu3Ul/PeiVskoVqfSn88vEvXJY0pMOL9Xxz8ahauXXU4Q4dyzwIJlotoZzxr4s
	5e7X4cFNBUYHkk58JcVWwJJkQC65pKKexnbJNDIExN6HXgKBV0wIQ5xFHTc1ZzL0=
X-Received: by 2002:a05:6102:8007:b0:785:c39b:6a1 with SMTP id ada2fe7eead31-7a55a31d735mr909161137.6.1789740452430;
        Fri, 18 Sep 2026 07:07:32 -0700 (PDT)
X-Received: by 2002:a05:6102:8007:b0:785:c39b:6a1 with SMTP id ada2fe7eead31-7a55a31d735mr909091137.6.1789740451952;
        Fri, 18 Sep 2026 07:07:31 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:82ae:cd75:d970:e66f? ([2a05:6e02:1041:c10:82ae:cd75:d970:e66f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm34176095e9.0.2026.09.18.07.07.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 07:07:31 -0700 (PDT)
Message-ID: <560064b6-73ca-4895-8415-b252b6824147@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 16:07:30 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/5] clocksource/timer-econet-en751221: Support irq
 number per timer
To: Caleb James DeLisle <cjd@cjdns.fr>, linux-mips@vger.kernel.org
Cc: conor+dt@kernel.org, daniel.lezcano@kernel.org, devicetree@vger.kernel.org,
        krzk+dt@kernel.org, linux-kernel@vger.kernel.org, naseefkm@gmail.com,
        robh@kernel.org, tglx@kernel.org, grandmaster@al2klimov.de
References: <20260731120246.1296955-1-cjd@cjdns.fr>
 <4917ef30-0ed9-4c5a-8516-1033b5f02fdc@oss.qualcomm.com>
 <f98f17aa-0f95-4b03-9f95-385e8af762df@cjdns.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <f98f17aa-0f95-4b03-9f95-385e8af762df@cjdns.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xcCdkA_M-XuY_hWeoBKkp-5joMjcUsqf
X-Authority-Analysis: v=2.4 cv=ZO9CCn7b c=1 sm=1 tr=0 ts=6aad45aa cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=6kT6b7zf8N4vtA4OZZIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: xcCdkA_M-XuY_hWeoBKkp-5joMjcUsqf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIwMCBTYWx0ZWRfXxUJf5bDgJbJM
 XeNRX8nTU+A55dKDkyGy8NoIzKzgwu/s84DCchGdr5BqX6u6FKbo0p1R5Rsz96BbliLBCdJJ1sL
 M/6hMiRamKKEqJrWQXzic0EuhyKfXIxMHaDuTw4faMrtQMLJUCPupxENKe0+3GjGxvgiZq9vPX5
 n/hbl3P9hTJ9JVyJ93ushduLW39vl0ZnZljkYCQ2vFkFiHLum4ki2qk3EXVcafzj4UOkYHGAvdl
 xPpRmU3QgyeyHH6FCrYxSdlAKn5/b3+y0ItUypI90z6DozZ20AspsqLhiQ9mqjGtWUfWDKYNUT0
 /DtNg/lkJ9xsUL0Zz2ORVocZl8B3f2EO3e/t8TGhy3eTvSmAsVvmaut5PDErmNkL+qnzwAEl1zW
 szM2s5Egetbef1e1XIoQYz7OEHgKBswxAk95n133bDe2hD6UezTJAx4R29VnkIygdmEXRwBR6CU
 mFXuLmD6UdOLAOCbYRw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIwMCBTYWx0ZWRfX1s6VMVyUSShg
 wI3gb/cvv2iVOB55TwPmV3+31zgEkmf24HwfGXTikDmAEdHuNKeiAEulQ6LfHRBTLh+f/APTuE4
 248HKTNKB6UPgwHkyegWBGXWV2k7NRA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180200


Hi Caleb,

sorry for the delay

On 8/12/26 21:32, Caleb James DeLisle wrote:

>>       |                ^~~~~~~~
>> /home/dlezcano/Work/src/linux/timers/drivers/clocksource/timer-econet- 
>> en751221.c:201:17: note: in expansion of macro ‘pr_err’
>>   201 |                 pr_err("%pOFn: Too many IRQs max %d got %d\n", 
>> np,
>>       |                 ^~~~~~
>> /home/dlezcano/Work/src/linux/timers/include/linux/kern_levels.h:5:25: 
>> warning: format ‘%d’ expects argument of type ‘int’, but argument 3 
>> has type ‘long unsigned int’ [-Wformat=]
>>     5 | #define KERN_SOH        "\001"          /* ASCII Start Of 
>> Header */
>>       |                         ^~~~~~
>> /home/dlezcano/Work/src/linux/timers/include/linux/printk.h:483:25: 
>> note: in definition of macro ‘printk_index_wrap’
>>   483 |                 _p_func(_fmt, ##__VA_ARGS__);         \
>>       |                         ^~~~
>> /home/dlezcano/Work/src/linux/timers/include/linux/printk.h:554:9: 
>> note: in expansion of macro ‘printk’
>>   554 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
>>       |         ^~~~~~
>> /home/dlezcano/Work/src/linux/timers/include/linux/ 
>> kern_levels.h:11:25: note: in expansion of macro ‘KERN_SOH’
>>    11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
>>       |                         ^~~~~~~~
>> /home/dlezcano/Work/src/linux/timers/include/linux/printk.h:554:16: 
>> note: in expansion of macro ‘KERN_ERR’
>>   554 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
>>       |                ^~~~~~~~
>> /home/dlezcano/Work/src/linux/timers/drivers/clocksource/timer-econet- 
>> en751221.c:206:17: note: in expansion of macro ‘pr_err’
>>   206 |                 pr_err("%pOFn: Too many regs: max %d got 
>> %d\n", np,
>>       |                 ^~~~~~
>>
> 
> I gather you must have built this on a 64 bit machine, so the size_t of 
> ARRAY_SIZE() is a uint64_t (?)

[ ... ]

> Any suggestions would be appreciated.
   s/%d/%zd/ ?
