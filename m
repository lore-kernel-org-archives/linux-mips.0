Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149AD78F3A
	for <linux-mips@vger.kernel.org>; Mon, 10 Aug 2026 03:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786331697; cv=none; b=HTTPc4O92I42FFo+7Eumgu4kinoodXuCwktgxwf2W2V7D2fzi1WgGYoQqk9b/Y4JVaCCLQ6/5nkkM6w5WEXqXuL0AmYQekmIAkwoBToPeuVZ0N8dVKF+8SBfGnOfLIwI2EGpVNEBp3WEK8NGmMOHRhFy2yPL7hryM3BPJ8FNA0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786331697; c=relaxed/simple;
	bh=+sec8ErACzYjJLn3AV+BPMhgRPD+TGuwp+pbNRFtO2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aWmDTT86SbYmEQU6v/OMvgMIq02AVi2QvMSycf9s9qtO+H+vFuiY0LKTiyjxdCwvuPhq4kGqRWR5+6gROWPbH8ZvMir5pcF0RgVB/BCVM4C3azts+gEi/5ssV0GVq079caVqRHTL0R2kn16XYHdKxOd3IZoLUxXvdp3CAvjIXxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d+2IQunS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OXRSv4B1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d+2IQunS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OXRSv4B1"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679LD2uk4103103
	for <linux-mips@vger.kernel.org>; Mon, 10 Aug 2026 03:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4OnuEW9j9G53ye+24dR/fC+FjzepwpRCFeVct6gvdhQ=; b=d+2IQunSX5veyokB
	Cgxkhn3WME+lIiMPyVsPlhOhOWylbFKvyZ7OW1rqeysUoGANkm5cifxW+VxewGA/
	CYPI4k43x7+tyyC3Ifw6KNEA5JXR/TSuhg6mKjFnZoidv3frHsJ3EL0jX6hAPuRy
	73T3O3Z3ioQWrUzDlotMktYithkadz95XVsW0EBrjZ9iV/q7nHAaSEQxS91K3cJC
	QwuvPVFa1esgBAzzTelzXDCQJKQFgay3TunzpuTlqiuOmIrE3XKBUs8VUqQP10qh
	Kzx4nIbuH1BpMLKdfu6cjwKU0a7rSW6z1mW32YjpnV2Wi5I1ibJousCxg/lFdDKF
	GRdv8g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy18xrm79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Mon, 10 Aug 2026 03:14:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51ebdfceddcso17911201cf.3
        for <linux-mips@vger.kernel.org>; Sun, 09 Aug 2026 20:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786331693; x=1786936493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4OnuEW9j9G53ye+24dR/fC+FjzepwpRCFeVct6gvdhQ=;
        b=OXRSv4B1tuU3z2BrqvQBHfVDbSnqfAiCwYH7d5g0uNyrMiQc7vQeHnpREQSAbRT4p4
         eGq0w6CUJoHT8fY2O8kCCI5KntziJQwCs8c13kyneCAAJGNxBusNUoFuBPampHUBmOcZ
         uBIndTX8cEIVzZFKg8OSNLOC2/PqT0ztfA4BO0tJrIjNehZGnRw8eIrB+y9jCbg/PRGr
         SeaBbbUsC/86Uk/QoLFAUnlxJqCdx7ChH9Y7otQ9Q5HE0ERwce9MY1J60Os1wBNvEa5c
         XwmOto2ZFXXzliWvGfv7Qz0vIJK17ogkHxlaE2+DLzDJrkxZ2ib7nGdROOc02DvE0uqn
         DXVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786331693; x=1786936493;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4OnuEW9j9G53ye+24dR/fC+FjzepwpRCFeVct6gvdhQ=;
        b=UYXbHJQU7BZgB8T+DCSPhtk4sBLMTv+WD6dRhhz7JTiCqbw7usR0/qbIzfhAsAmsTm
         cy1qbiAmRRPr4iTqcS1661cWWgVfV8/bgXoTf7Nai7jL1PRIOjvJbqA39zDoxU2COLLI
         rU9Jq+xN9TwpSar314ewuNrzG1E3o+dCapd1A8F8k0dBPOZZdWB/YYJ7Ogd1n3F/KmZT
         rq9SF09hyyvwm1jA63O83/O3TmvcE00cMtdwR7UOorjRYI1JL3AR32hu+HGB3u2SE2uT
         H37llqtkqDL7zsskcTI6fyFHL57B0Qt0W220Y0OxGmkynK1F0Fq+92KawvhEOktSvu4t
         BLtw==
X-Gm-Message-State: AOJu0YxSZGiRSrtDPQ1ye9SFs8cal+bBDktpB3pVFqWIssh59nC8ULD0
	PisHv7MrRROSt6ZveFx1V5PxNCpri4r6z2bH2KT4hsh8HMjxr1WeV9HhMrna3AM+Vp5lb56FTQn
	akHp4IcC4ZPVKpiscmZFamg6E/0PHSkFZ/qT9GBl3OfwFX6iyHHwBQcpSyY6Bt0hoqvnS9glB
X-Gm-Gg: AR+sD11DaAySmZs6bll8bxxB0fBS55xQo6QOAg3KNpAoI5yh84nGK7qBx10IZO6lzmO
	0PKZGl+iEjBXhYLVKDVS81nUTXU2OSZHV5xVkEhbjLU9fNJuC84BzAkjDxdm7ryAkWwhW8ciGRW
	fhsKYMcZ1vxcTsF6ava5TGfLMF484kAm7+by3Zy2IR7Eubn2TbrFqEZnNEmZte5luGUiizak1nW
	dS4q92WdSRsquNdIJRiktwxKGl0VcOPmBaEds41Qv/mU4KBgTEjWy6HLtgbFSZQ37SkRP8A6MXz
	FikFkaeWLOIffsMPtCANl6b7VuPzZ3crjGSBKrqBZv+i3daMChF6h4HNV2bQ4CEEbY5ezyTXPbq
	lUoOtcHSrPh9SXho+5U8DAV1G/ed0TghaQHo=
X-Received: by 2002:ac8:5a50:0:b0:527:69dd:5413 with SMTP id d75a77b69052e-52ce5f8f737mr414847621cf.5.1786331693318;
        Sun, 09 Aug 2026 20:14:53 -0700 (PDT)
X-Received: by 2002:ac8:5a50:0:b0:527:69dd:5413 with SMTP id d75a77b69052e-52ce5f8f737mr414847381cf.5.1786331692935;
        Sun, 09 Aug 2026 20:14:52 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995421fee8sm332112825e9.7.2026.08.09.20.14.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 20:14:51 -0700 (PDT)
Message-ID: <b28c7fcd-6851-49b5-87f1-1a779c61ef62@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 05:14:50 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] MAINTAINERS: Add self for the sb1250-duart serial
 driver
Content-Language: en-US
To: "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <alpine.DEB.2.21.2608060423110.55540@angie.orcam.me.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <alpine.DEB.2.21.2608060423110.55540@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAyNCBTYWx0ZWRfX8X23WCA0eVha
 TYMk7Ft8eXQn0w6t4HblVOYsMN+FeyV6xoygPH4Yv37oAkJsOi7AHXEXin9KS3cvvphfpTLFzPA
 IJ3bZT+uzxf1ZpmBiblcgvtGb3ZaZ64=
X-Proofpoint-ORIG-GUID: wdi5zXlfhdUZV1aicCyhG-8rxTrOpyE-
X-Proofpoint-GUID: wdi5zXlfhdUZV1aicCyhG-8rxTrOpyE-
X-Authority-Analysis: v=2.4 cv=bfZbluPB c=1 sm=1 tr=0 ts=6a79422d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=BcPKCTjPAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=MNXww67FyIVnWKX2fotq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAyNCBTYWx0ZWRfX+glCjP0uMZUu
 zwEsY2t/2YuavnPpZvyUQFXqXQFHKW6PzA39J8qdr9Pe+wSwFWqy8uhY5lltnNHlrZDxgQRZFLM
 Ik4DvLlKq23bAfXo5+bWersG7foCZHrQUjIQYaTNLGt0AH7xjRyPXugTZhIuZM7AdIgu1YcE7ga
 m9Ln1He+vBENAHMUb+MZG/ASJo55gu7FFp/bSdMmmbyuG66DH97WDKiN6HydcCVLqND6b/k5ciB
 o1qxRmn+M2BopavwBrsf4RsQ/FcoT0+8KDaZxb/ioEEM5N2m5JkhTA8YczF9cBNwwoCpNOlIWgT
 rhW45kPZob0370dazTQATyUneNohLo0hiWiYTf8G8AEMQ+yPet/rknUlYHM2cWMMbQjLq261ja3
 XHPLubM3r1CWrzMxVzIjb1pa6WkIQRTGpKRHk+Etm7PqmZGUdlkqIOHmY0PLfUGcrkIvLK2Dpvg
 LB+vr2VvelZCpM+CADQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100024

On 6/8/26 12:54, Maciej W. Rozycki wrote:
> I wrote this driver and seem to have been the main remaining user now.
> 
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> ---
> Changes from v2 (6/6),
> <https://lore.kernel.org/r/alpine.DEB.2.21.2605241637170.1450@angie.orcam.me.uk/>:
> 
> - Post separately.
> 
> New change in v2.
> ---
>   MAINTAINERS |    5 +++++
>   1 file changed, 5 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
