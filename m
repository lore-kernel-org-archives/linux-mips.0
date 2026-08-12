Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C753E9C08
	for <linux-mips@vger.kernel.org>; Wed, 12 Aug 2026 08:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786523539; cv=none; b=Ucuj35L6b0I/zORxnySySIIzposDbLbhlRGZaV18NdOH+C/hV8tU47QLkSCKujQSiIAQSE3yMQbgVca25Gt19QsktH6kK3s0A8B894DNKj4TLCIEOqMefu0APN/vwrQdfH7FrtvytpB/X/vguWt4ohZRPPyunucUjYPjJ6WVaS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786523539; c=relaxed/simple;
	bh=A3S1d4xkoEt+tF6cKjXmjHZ/NIiDjyfZkhSRsMbL/Aw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FNw6cIYM3zzb0EAQgbhGowTA5sucAvGeoCepQ+l0yUhquu22Xp+HrgGGRw5b08m5yL13pP0rVN+duw5NQiv5g9Br59Y5wZHIlzU52FOM/QTLkhWtjWG2n0nXoTRofXPJzl0s3FeHXmUqXaW7s8vNu6yrR9jVSXi/CutFqU0PFBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b8C9Yqg8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XKCWcWoI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b8C9Yqg8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XKCWcWoI"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C62k5w2949451
	for <linux-mips@vger.kernel.org>; Wed, 12 Aug 2026 08:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F/8vPlq+lDaVRVyYzxnX3ia03ZkqYeEvpa9DaYQHgPY=; b=b8C9Yqg8Zv7ud594
	nLhBjn3LD0R2IFoZBphwr8fNk+G3TqgTAuGQRrLfP3UKNc+w9ecbVuIvfdwhgDUx
	MskA2v+orWOZkzQQc5qbsAoL2X/1Ibgu17Rsz0bi7WmtOCjmGpoHHovoyRSvSfgt
	jTafQSFR/yRRt4vo9apKANAlKhmbFAiqH887KCdB6o9SoZf546OmI7m6fYiyPZ7a
	WFCs785nwPsjy22clIkMH1I7BhQxrJiWr554cT8F+65SPndBCqt7Pm1r4Vwg1hhN
	7Ok9ydvCxHueLfYe96jQOcXPNTpqbrv4HLjZXsYIp38gQ6bCWQ2W0o9Ba55y0NMc
	SmZw1g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hj2rxdt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Wed, 12 Aug 2026 08:32:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52d28f8737eso14004881cf.2
        for <linux-mips@vger.kernel.org>; Wed, 12 Aug 2026 01:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786523536; x=1787128336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F/8vPlq+lDaVRVyYzxnX3ia03ZkqYeEvpa9DaYQHgPY=;
        b=XKCWcWoIWoUejmddKjrQnHFexvKnamaGLQsF6kCfiDcz2hBDQcVU8zhQu1CYEkKlRT
         ctT5DttlZJLH1T5JQsEFMJodzZhr0nRCfFIC0RUECNM3jTUS8vO92FISWtZJ04qlDH1x
         pXzZNa/AgU1HbsTkROpnjJObGmxzH5an8fAhqZSQNyNcRJq6PAGyY49Gj8MxoNIjJUzz
         pdUCPruUQ7rvlsdUceLnHnK+RcB/3SIqtPHFkyBjYvCit0d7+0FiUORxhfNFd4FKYM+0
         gk5W8iDglP7TolyEte7NBJCiJiLnhYD9bMjFVNf3pnJmPAOjU6FhpnTLoR3m8KXLmJSV
         O9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786523536; x=1787128336;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F/8vPlq+lDaVRVyYzxnX3ia03ZkqYeEvpa9DaYQHgPY=;
        b=PdKNU0B2QUJx/9QwGmCieTledjOWkhiEVgzcU9RY4ox13qluXLKiJqfOV1inHQ8xpY
         Gs/xf7LiFV6xrHq1nQCjRSCy7QuiWgqrsdIlD9wmpDo1ROT4l9deprAt7pk4f85mmbkM
         nSt2jqZFhFzYyqm/4icBXblRYY4rIV5ahJSaGPU4l4E/vT02R0wr4QIVAprV9GXzZ49I
         f+cjPWa+Zmv7A4Y/g6eTflNmeqr880h0WQ6Pqvl/9tKoyKat8YoM6pcWqRAE4DuqldJq
         XmNlre4UO9fQ02VQ8pWZiOE9gclj2nTzMBsFSsAy+tqwrWfl2WCvILaHyJw6qA3KGyUx
         ewuQ==
X-Forwarded-Encrypted: i=1; AHgh+Rog3dw+HmjieB9fltkifKJJDbJe62Vqtw9cWtvHLNN43e+pabaKRhen0++Zik8rBAUWmrkPUQr/TEZ5@vger.kernel.org
X-Gm-Message-State: AOJu0YwnX1+0MvtrQ9SwqmSJIEt82EgFXoel0vV9m9fk4N52eGMY7Zbc
	HUqdVis010fE9qTvOK0x2F1smtfJr3WPGRSYqZScURRaRvyYMqtWN6hi30gh8k6zJfgRmVc61h6
	1UHNSSTjEpxEiTvVFNW460UXr9FcGk0xVZK/i6nexmEit6GJWg3L17rk3AQBDn8OL
X-Gm-Gg: AR+sD12tCEcLd267BWSvWHMKju0y16fIvnK6U5YNVcuc6TYsH9D9rJ1dn6HrOoPFRRC
	PZAtGiFdmFmS4Tv53HXVZ9/inASndxZeLyj8jqClmQfIcy0vcYmjcYTkZbhHPnn7NeH39nZst3v
	Q/9WX1tHZ7Gozvq8cmtEllVeyXlX9YidUbkEOR9e7+LFq10EJMtcKfHHVX2MRzZRXq5ozh8eE/N
	GKgOdFVmVcMelnH3YOpyIVEixQmZPoMfsX0+Capp+pOzJzexS02TfsTDlT7y57oi4Zh/smxfHXF
	48exolSm7Q5ZBOqqsbzmN0qJ8LOUqn/d4YcK56H+xEaOJMpWDwK+I+N+jiR9fxIO8kLQwNlXB2o
	8CRQ0rqs4l/agJ5na7DL+P57p6XiWIv5b5/n6NTl5QAG2VjQR4sHwm89Ez5uxoX4=
X-Received: by 2002:a05:622a:6082:b0:51c:1ff:2512 with SMTP id d75a77b69052e-52d6482da1fmr25847531cf.33.1786523536346;
        Wed, 12 Aug 2026 01:32:16 -0700 (PDT)
X-Received: by 2002:a05:622a:6082:b0:51c:1ff:2512 with SMTP id d75a77b69052e-52d6482da1fmr25847101cf.33.1786523535827;
        Wed, 12 Aug 2026 01:32:15 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:b467:f322:cd3a:615c? ([2a05:6e02:1041:c10:b467:f322:cd3a:615c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997d2e4ce5sm9693755e9.0.2026.08.12.01.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 01:32:14 -0700 (PDT)
Message-ID: <c70e9011-26e5-46b6-aa1f-c7f0c179611c@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 10:32:11 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] clocksource/drivers/mips-gic-timer: Remove
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
 <20260724-vdso-arch-clockmodes-v4-4-ddbe447be860@linutronix.de>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260724-vdso-arch-clockmodes-v4-4-ddbe447be860@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a8EAM0SF c=1 sm=1 tr=0 ts=6a7c2f90 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=dVVT6RvzqqZ4HvZtmZwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=VT0m5QDJU3gA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: mUOtl2-COSsRm07k1S8DOSGlqnpFcLFI
X-Proofpoint-GUID: mUOtl2-COSsRm07k1S8DOSGlqnpFcLFI
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA2NyBTYWx0ZWRfX3J+vzeXB4hA7
 waN0zb7w0Td7IBnmaD4MAjprocet9im3LhCFhWKXO8WbhYsfrDeAb6j4hrN7Z7eVK9GmgTuTyAh
 x7s2jKj20ZN0BO+9k7AjJRNhKytjT1A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA2NyBTYWx0ZWRfX1XRHbSc+aQl+
 qM2WxQw0O0bRG8t367ziwHakXbesUQ+Te1/bmte5ptx6tFQqKlEDp7+APIVgk7ttiIQVxbKmJWr
 g9P8RhAV95UVRpBwHHcTfb6J/E1hcHKSbg53asgg8uVS7RzvAoALQWKMTB/U9aSU6JqVFWpxcpS
 Fja21e+UMDnSr68Omsx+KlQChiulkCkU+vP7WeSphMO6EXxyh/WYJ1S+d3xpYBVE2djWwdq075/
 qr7CniVWecLsqscK0qGs24LAU154sJRvMB2+wIaZnrXcePfEM8aJ5azphzpw40e3BVe/T4XcA69
 ahqX7D1JOarCOxHpLRsmXr8VtSEAFBtUmdQIeDFBrZJ+z/JK6Is51U8g9SYZladC1xgUmvA9aTh
 iqkUSUrBk33DL18Jn3+fAJsj+ybh6hd3vQ+IneqIiksr6rqv5Cixv+ON1Gc6T04TK+iUICLcgL4
 jp3F0CQITg9sfvZ8Bbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120067

On 7/24/26 15:36, Thomas Weißschuh wrote:
> Now that there is a definition of VDSO_CLOCKMODE_GIC even if no
> vDSO is built, the ugly ifdeffery can be removed.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

Acked-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

