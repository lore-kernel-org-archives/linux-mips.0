Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04643B2FE4
	for <linux-mips@vger.kernel.org>; Wed, 12 Aug 2026 08:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786523599; cv=none; b=XJqk/ea0otoG7OhLZeoYcF0Pk4gejmuCb6cITnSZ+xtaeoi1FKR+SQzFix908nOxLFqLY4bH84HIltG/Ej5B0WRxhP8VU52clq/YBz1kI6p9fBuYKzBxpETta6QEgWtoYwXP6KKf+lkTijisWwR2R8hSG2YwkDrwkFdmSdVsItA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786523599; c=relaxed/simple;
	bh=AfnvPvByM7NhMG46kRUkDxivAFcGgmGj9xeqW0owLps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IDj8BTckoEHCDMGLEdPCQnWc2NyfLn+jnnhcBqONOIX7cUcC7c2/cmZJDjG72/K1RDtM3qsccLbAUTJ4CXO44Igh5Y+91zaPXHiFCnvXcTQ/9gil4dvV7cVilDZKRAUO1tBMWE/QAm+Zddz7Y9TliV1IKDNXp7v0OeGikzoZSPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CMi+xbV8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gGye7pGk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CMi+xbV8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gGye7pGk"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C62OlX2962289
	for <linux-mips@vger.kernel.org>; Wed, 12 Aug 2026 08:33:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HAvLO0GLp2loAsKy0xyKwG5aLfgTFlT7QknME37DmoA=; b=CMi+xbV8rlZ997l6
	8ymfyCRnjTVDNYMTFbQHDvUOjeReWM0cMy1Nw29jxh6/EDU8FzIYaqrlwgV6Dugn
	Th7xAreT9RbRpZiaZNk+Ysied6XpVbJFURZv2SgQTM/+JG5tUZWc3Lr/c4Vf7A5d
	l6jMNpk5fMu0/wKwGbZkUeDeUixWNfMRkRazXLD0J8FxCUGrAjjVIhnO7GBU5dQD
	bvumQhfhc1mO+doLBf+WbbcnepCS6H5Ic6uwaJaHFNlixse9tH3RAXjawBbJR5fQ
	hO6a5Chx7vTh8a3CJdlOdTlrQnchK70Mpj7t7/gHEA8jL3rmO0tDthA+ANAZEa6T
	OdEjbw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0jgrgque-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Wed, 12 Aug 2026 08:33:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c20762d21so11113741cf.0
        for <linux-mips@vger.kernel.org>; Wed, 12 Aug 2026 01:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786523596; x=1787128396; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HAvLO0GLp2loAsKy0xyKwG5aLfgTFlT7QknME37DmoA=;
        b=gGye7pGk/uSd/fTCybtmLPEIQ4Njj5JUVw5hzOu//ZxoMLTaslt6r3EpfAeKrk7TSQ
         QvsHR6jrJYE4P/nTcBjddr5Zh4C1cyfe2rYvQiCE3VhotXQEoE2GQvFDOcK/0PvitBkr
         Z8cIUDiKa4hNjAWu+zFJHRHQifzvelnOeTrBK5zwcziBvXB/hJ1VigzoMHfwrWOQMoo3
         WqNkM1hW2ZzK/9Jk8xvYfN9+0o5zr0tVn7ABz+RoNMd+D+KTmXm6m1WkPdSCmAnglE5P
         WcNEshf0h/tp5WpYlg81kISjvUaOb5XUuczMXEk56THuO4JPp4UWUkazq+GoeuIQ10Gj
         451A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786523596; x=1787128396;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HAvLO0GLp2loAsKy0xyKwG5aLfgTFlT7QknME37DmoA=;
        b=DJQjBNj3VXru+TAoR+1e9fHBRSb7Ob70IeKqW0BQwh4wswhTNAnj5gPHr4Qj8F6HQN
         czfaIV/grj1AtqZjPJf9wv+Q4c5TYgsWI/ATvQRTgA578lisFkQrT4C7ZVoHn/iH2EMZ
         tWFVapnptP3DWEYoIvJMW33UeAj/QD2kk4Rv2xYm2ngkRteYbFjjHnHkR7sVr+RTfabd
         KV7L8of0JCRF88MqrY4OUFwGWzCNnoH8iuJMfY/0CpEgtrlO0FoPdFwvER37w8csGsMn
         h0aletliAGnXJ/Y5vllKu3iWok0p2c9N1jZ1OwlJ5HvGVLFHroPfmHLEp0qdtCJSEexG
         tCsw==
X-Forwarded-Encrypted: i=1; AHgh+Rrhd1lNTrJZR9C1ep5hJnCF4Qs5+DMO622LvpMVv2fWhsPVYGbfCdSRmG5IAvMBOV9W2znVNK3RGgp9@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb5kVXMrQqAN/cXzwVuSa7bZciqMLrvTcKiWvhSQDNeZlV+gru
	oWwU6d6wOzf1VZ0Pw+pVYtN1Fpw2IO0tlVlwLrL3GpOZXP474Ny1D0TYUljnYj6iko4RXqbwatQ
	UCW1FSvHIuH5nT4ZuLYYbpeoVxB+jInqGU1xyQJ6OsLYa15+SMgKYCuHt8JVYxA/G
X-Gm-Gg: AR+sD12/YM3QoNPfd/3On4siom1Ee03jRSt1BnpfL0dbOilsqpJXVR87TiXMNG32rn4
	Hd8ZjuxcBZjhFLGrvjwuLLV5uG2ZRF6YGEi7RJROjJNDr9fgGXL0z5i7tFRL1mLiOgejPtDK1BO
	w6CJObT86HqZB3BTRYgVGqeLvCRTd/+/bEnq/hd3Qs4Mitqg3MRhhRk2MRXlkZ9HW65FG4xD2rA
	7i05AnCa7Mlp5Roh+vrNZZ3hJFPMnCuTLb/RGcobMqb8of3Zu9pxRKvC5n1oU/3a0UFE3CloC1H
	8hcYH/fS322mS+K2cfu3qXHrozZdRWbQlc/cLoRE/ZmbCWAt/op0MpP7+g4FfT3vtwOM9ilGCYN
	tvY30LcymRse+GHZyR+h/dwrvg7W17d0NC7/wr9Fg7wN7ZABgUURleFKiBRQ+Flg=
X-Received: by 2002:ac8:5d16:0:b0:517:76b7:7b3e with SMTP id d75a77b69052e-52d64823701mr25115381cf.38.1786523596201;
        Wed, 12 Aug 2026 01:33:16 -0700 (PDT)
X-Received: by 2002:ac8:5d16:0:b0:517:76b7:7b3e with SMTP id d75a77b69052e-52d64823701mr25115061cf.38.1786523595799;
        Wed, 12 Aug 2026 01:33:15 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:b467:f322:cd3a:615c? ([2a05:6e02:1041:c10:b467:f322:cd3a:615c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997c998f27sm28031395e9.15.2026.08.12.01.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 01:33:15 -0700 (PDT)
Message-ID: <16d3f0b9-2a12-42d0-93b6-b9da3f540256@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 10:33:14 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] clocksource/drivers/timer-riscv: Remove
 CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
        loongarch@lists.linux.dev
References: <20260724-vdso-arch-clockmodes-v4-0-ddbe447be860@linutronix.de>
 <20260724-vdso-arch-clockmodes-v4-6-ddbe447be860@linutronix.de>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260724-vdso-arch-clockmodes-v4-6-ddbe447be860@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA2NyBTYWx0ZWRfX+ZGcmb+aApli
 fJLryeWEoikQoQf7bAHZd21ePT3dgvkgktvjr3rrw3/igxPJ6p5rQ3Fi3cOHsMIHNfSeeHV+l61
 7I1ga0gEyNSj+Hfr0Ju1ohzt4eRbCmmDoNIK03w+7gxKmJvSTkQlSPoPXAxr6/RqJdsF7ksqpuZ
 71B9IGuIyVrZ/HJdHaImFQNG+CrRpeWI0rJr4ON1AtpPXCkCl+0ZgThAS4XaFHrcHz5FG0AJweW
 XAF+x0JLV9lpeO2t99W7C8P1bzgtiZkhJu2hkYe9pUMdaG6lcJuJVi7KwcHKdqGOS0p44bLxwCI
 NXemIO1vMEBz27+ORKeeRp53jSfBS9Pm1IM8fxacntV+Znx9ksdMM6oN2+5SWoMycgvmlNtkbwg
 WQRYOGXJCU/g5TztGKZqfexZEu6vdttstedhOamK9cRa+GGDN68FQtBmlXxDNyX4dNPMuAXXa5e
 4oY4drY4aGPaJnwJDMg==
X-Proofpoint-ORIG-GUID: e8shmrteI7IPf0loPSePIphsDJK7JhPL
X-Authority-Analysis: v=2.4 cv=TNJ1jVla c=1 sm=1 tr=0 ts=6a7c2fcc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=eCx_7nzpRrifSLxMv2oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=VT0m5QDJU3gA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: e8shmrteI7IPf0loPSePIphsDJK7JhPL
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA2NyBTYWx0ZWRfX/9uFn9gnnWSu
 EMiNd2lrRXTKX551+uCwCRT4/32uNxGl5JCMEW6wAnouoDz1Rv98JUdj4FNAkteO3Asel7LiEL0
 iEfuUiKm2r49RBgzxlNj2+4jSWBX+sM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120067

On 7/24/26 15:36, Thomas Weißschuh wrote:
> Now that there is a definition of VDSO_CLOCKMODE_ARCHTIMER
> even if no vDSO is built, the ugly ifdeffery can be removed.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---

Acked-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

