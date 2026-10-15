Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C013C09F8
	for <linux-mips@vger.kernel.org>; Thu, 15 Oct 2026 07:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048893; cv=none; b=NgknUjjGi8A9TGhzJEzbnFtiIQDEOuOeXlxSXuQ+OyTP3FalcP9b1UD4U7BmNjEtZYrBndW8i9D9Con/wpup/tVi+SB6jPfl+7tHtdjD5hYSxhTXZGFF5RV8Rp3jIf0r+tb2VtPuMZdWQ5DWTmNDJIq4J/fUbD8LM0iVNGtw6qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048893; c=relaxed/simple;
	bh=i9PGNYI4FgKmm5g04rgKr3I+6E1QizmO/YnLvfMjF2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QpTeNnM5G/yUNfuv/qCtM+ePv3o4L6kIXA7g/tnZdlydpiNxWFEh4CRrMiLwvxR3D/Zdv2luY9kzod8YEk26nwt3H8qNMTrivHap6UrTpxRUTSwMXIh9hOIUbyCBUBnj5iEf44hrGu6VBuMmykJ854kegervszbcD8YJ2adINGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VY3TB6I5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NXN5ZvEN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VY3TB6I5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NXN5ZvEN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F0p02f3469215
	for <linux-mips@vger.kernel.org>; Thu, 15 Oct 2026 07:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Vh8VDafyxQoJ4R6CmmLgnWnqUOhc9iVaJBsTAw855I=; b=VY3TB6I5J5fsvPQE
	Z77MhghDb8P0sczgqNbV94IEEhKZ2W36YXjvgUSyzbXHq5oW+N+zlRzdM4EkNnkt
	UmWmVyJOSAIRkqbtphOHG+Rk3+LOQ6wUxR7gRI79Nwxgkf/8yVZO2kDbWTzpcSrE
	S99wNwv5NFuNgBzcLyyvL66CQULWUSDeScrTeFXqpJbBN3zpz1BTk4NRJcUCcKIi
	DH1EZltqQFAmxQheEtUkOZTQJ0AdZ6UD9FxZfCYquajVGF/Et42gMTRxzwqGVIPG
	y7Eb3A06UkfNH7zMzQQXDCtuI7ryrRARuoEQWGZUAl28yzKA1OL6mlNsFUxSdY1u
	eNwFEA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hadd7axvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Thu, 15 Oct 2026 07:21:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e82060977so362901385a.1
        for <linux-mips@vger.kernel.org>; Thu, 15 Oct 2026 00:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792048884; x=1792653684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Vh8VDafyxQoJ4R6CmmLgnWnqUOhc9iVaJBsTAw855I=;
        b=NXN5ZvENJYwo+TBPDxlzWp4pXNOcSMq50ZJ4duFlVr1WAYk9WF5mkS/KhVgc+7JKAg
         Vyoo+arYpausIpa//dWJwG6gb3Vdkcj3rd7KmikSTaxLuW78TKJeljlsTrp5xnGDAmGi
         gUjgv9blR/bBHGY7JECFus1mM4+iBDvb5OrKtTW60Kw1/AWv5SGZe1uPva6j3dkvRJj7
         mmei/OlQ1wbrzxDQK8+zfQJNkJ7PcuJlTsSBpLPNZpv4gDNetDRJnrBaUMtyhmDmsn49
         ARZX2RS/i1MkMWLwk9xMmwSF4BMjZ2SzEIIqI8GKtOwTPjdnAy+ivOBUd0wCN3dkmIf7
         9s6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792048884; x=1792653684;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Vh8VDafyxQoJ4R6CmmLgnWnqUOhc9iVaJBsTAw855I=;
        b=ZdnChyYy3WivMZaCVGikJCLJbgU1yJHeE/BRiZmseaUyMI4TZ83/7cKzeq0eTmeOL7
         BoMr1jaUR9kp6A/XxnVyOk+sR9eXysaJEFoSRFCwrvGu5tk2LaFxg7TQOTRHWE54sHw3
         j6EaHpfY2Xn1weVZbQC6iVt5R9RhArbb2ZmeyoQBU9uTW4iLtSUFXptCtNaiNU7nYDRz
         m04c0VtBELm2ZSlHw8NQGP+Pbk071GYv0bVkrJcfy8iLIhlEt/ZWpLsZHATzrzOchU8c
         UJRtsL5Vh9yss/QtYpioGpJs+7gVItvtoGPr11r6qbkRAbWud3UvciF70Q32iPdbdE4r
         7xDQ==
X-Forwarded-Encrypted: i=1; AKwUvByzZuEvD+2PKZIca6gzZgS1DaT6F0OFo0ev8FOAfJyRQdmp297E7Kz5BgOC/cK2WYMgEMtj7ThIyRs2@vger.kernel.org
X-Gm-Message-State: AFq9FYKmsRm6uDzMrcX9zUWJHyTxBIU1St6lM3RDzG+IpK72mbQpPU6h
	xMDczIih7NMEjDNRqPiQud75p73fvVx+FNT/eq8OHTSIFQHz3tnZ5wfS5KAOulIzkfnmWmIf0yO
	mWVSQkOkH9G3o/sJxRRq9GnNpIwpX1aWYUGLzTq+kQg2ZymPPwlIBXGyScq7bXEQD
X-Gm-Gg: AYBFou1eWWOprW3h8P9i7FAl/g0buyGvDoeRRZfBuGGvDJZ3VcLnC9+OJK4Mj3vzAGH
	Y6PojTcwfKyHGlLM+yufiPiMmxGgijzt10mFsz7PNolU62s+TmGXWsyP+f/a67TlXImOHRBh663
	IF6L8IsAPHxsHr9WJYCRHaoo7AgOoqTFDfWvkTAgsnEKEZ6gy3z/2YDCtbh+3Ey6R5hQQqDX2ta
	G0Zqzf2QwtBGCimIYdYN5EHBXRxpIrXzy9lzTs7n/nt2CvCyWb5ZNtYrpxVrgYcWx5GbBo8L53L
	RHMQOO7FVqXb3SLSm/TJ5YYbdZawB6qbariNY4DlhpOb0JiXQQFXhwWSIOxO9BLYAc1Ja8GtZFq
	A+GLrmnrScca/ZjLumZDfB2W76RjHGcXS71bpnKR0SBAJ39CdjqZtXhJcj8Vfog==
X-Received: by 2002:a05:620a:448e:b0:93c:65e3:df81 with SMTP id af79cd13be357-93eb95e3948mr2983884785a.13.1792048884582;
        Thu, 15 Oct 2026 00:21:24 -0700 (PDT)
X-Received: by 2002:a05:620a:448e:b0:93c:65e3:df81 with SMTP id af79cd13be357-93eb95e3948mr2983881985a.13.1792048884088;
        Thu, 15 Oct 2026 00:21:24 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac52d3sm16747351f8f.43.2026.10.15.00.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 00:21:23 -0700 (PDT)
Message-ID: <08095630-fd5f-49f9-b502-d5b2b33c60f4@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 09:21:22 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/5] clocksource/timer-econet-en751221: Support
 EN751627 without percpu IRQ
To: Caleb James DeLisle <cjd@cjdns.fr>, linux-mips@vger.kernel.org
Cc: conor+dt@kernel.org, daniel.lezcano@kernel.org, devicetree@vger.kernel.org,
        krzk+dt@kernel.org, linux-kernel@vger.kernel.org, naseefkm@gmail.com,
        robh@kernel.org, tglx@kernel.org, grandmaster@al2klimov.de
References: <20260918153606.344143-1-cjd@cjdns.fr>
 <20260918153606.344143-6-cjd@cjdns.fr>
 <5874ea6e-4e2f-416e-bcc1-851461c7308b@oss.qualcomm.com>
 <7108eadf-5dc8-4f39-beee-d748aa88e9af@cjdns.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <7108eadf-5dc8-4f39-beee-d748aa88e9af@cjdns.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BaVNQbt2 c=1 sm=1 tr=0 ts=6ad07ef5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=fx9yKbBvac2UQYKBdUIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: gp-6NgYNMKoe6pgiEon4Fpn3nBcLNI8g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyOSBTYWx0ZWRfX8QtBqT5SI4Cs
 vZE7gfMWyEQtFRazV2m4ZUmksVn4Kvk6UxpbsPPHAkFEtpb74EVEg3wSqtIKC2GzaM6oWf0nJxr
 fcaQTOFCyqOzQiDX3gZTJoE7Ho4o2o4V5nGZMX1F5htRZF0gaCg7/uOVbP3GX+8Tf3WNWUmSWhp
 rJbxqkwJkyPxENfMPXoeyWswMYE0aECTZV0oW7y2vVd/rR7GCyb5vneMh4VVN1ZvwZQtAUjNtqg
 jReB7BsPFtujAPZWCDj1+Ai1wsR7YLeM8ILEuZ1BnQAForZpBy5DNPBdpavI7ePk0DyceESl6V0
 9QkPv5IVZ6blhSk4gBHajztU2GVYkl9CrdTRbDIaa/AnWpjomWUPsOr0CmBtkwufgK/5IsxVhtc
 fhsZUVztJvGk3WrFbWONzPnFeNvdt4/UNjyIxJWb+1a4V75xn0jjNbEi2bH35G1RLubPqh/Y6FZ
 wEhthq6GpGbhm8TIjbw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyOSBTYWx0ZWRfX/bl+tSEyRnkv
 hbnOGTrTjfCcmhrP+U36B0yHJ9CVWbgESlklVu6a8o4cFOR2WvGEJRKTcVAy3lzORwAbkgUqRLT
 zEwFHPgc1UeJ1b7STg5/Hnh73SPYaYc=
X-Proofpoint-ORIG-GUID: gp-6NgYNMKoe6pgiEon4Fpn3nBcLNI8g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150029

On 10/14/26 22:36, Caleb James DeLisle wrote:
> Hello Daniel,
> 
> Thank you for the review.
> 
> 
> On 14/10/2026 20:43, Daniel Lezcano wrote:
>>
>> Hi Caleb,
>>
>> with the help of a LLM, I got the following two issues with the changes
>>
>> On 9/18/26 17:36, Caleb James DeLisle wrote:
>>> EN751627 is based on the 1004Kc which uses a different interrupt number
>>> for each CPU timer. Support both this and the EN751221 which uses a
>>> single percpu interrupt.
>>>
>>> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
>>> ---

[ ... ]

>> The binding requires four interrupts and two register blocks for 
>> EN751627, but the driver sizes its resource arrays from NR_CPUS and 
>> rejects DTs exceeding those sizes. Consequently, a UP kernel 
>> (NR_CPUS=1) or an SMP kernel configured for two CPUs rejects a valid 
>> EN751627 DT before registering any timer.
>>
> 
> This is a fair point, and I suppose a reasonable thing to do here is 
> instead set num_blocks = ARRAY_SIZE(econet_timer.membase) so we just 
> don't use the other blocks. I can send an updated patchset with that.

IMO, econet_timer.irqs[] and econet_timer.membase[] should just be big 
enough to store all nodes without using NR_CPUS.

Given you have num_irqs and num_blocks, why not just kzalloc them ?

