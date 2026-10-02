Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E95429825
	for <linux-mips@vger.kernel.org>; Fri,  2 Oct 2026 10:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935358; cv=none; b=MD/BMoiXDW4yJOkqBRGSb0JHxFzI6niVg+EfASOeihWwSEg0RHKAxX9WxklnZrpxcfAYNOuaY3PqJ889spJ3uyAK8lk6tU5pEiJiPZ61bF/SqHIz9efk+zWZgGuogVpVRwQUqz66RqnXJBXPfwX9of8Gyr36NaegY7Z5Sx+4u4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935358; c=relaxed/simple;
	bh=yIDH2l7v7vson2N5Vi96ngQMczGbNHvdlvv9YzgYc+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZLB1R8YHTxqHQeFCq3+VNEah/gY8FLjACS6GC53Jy+vM34MAz93tdWeaVDIeKivpEi6sQr5dS5CS544u6fd7VKfmyrPWN3UPcJRQMtjIEwce9PpacbjAdRKhabpAJNSxhMWNdKNKk0PXKADHp+V8zfRstFm6ktEMTZoIQos0zyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HxocGDNN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bg5DpfAE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HxocGDNN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bg5DpfAE"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nZ9E1190351
	for <linux-mips@vger.kernel.org>; Fri, 2 Oct 2026 10:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Liz2cCmaLWhV5NPUrTvM1xU6DHZve8vqyeNzJz5JT8s=; b=HxocGDNNOaME5DOI
	m09VbKIVQvNABVnkEhTIqzQ8alIiFBUo+SBW6JH6qLNb80mBP6sXKrLAT9k8Jy9L
	PT6AHIP1D4LHZTGQHH6wL4LGWMhZvP9vO8xnEooO7VxXLElO27r9y9xJDN8a20Vz
	cczlDj8Mu4T/KKeotsw7tQzqZNtXCVEMFmMhe8UmQ++ttDlJaXez9Q9G56dWJ72W
	2aIOLFh6CK5SyhhYlc+KmuXalFVIkT/u4Rt7tADEZX0WQhgQfdZmX7c+xCia2F5n
	po6glUTCo9P2kaS2H/Frzm5Pog+vyCmUIMwAa4INgNL44YTguW94R2VOTjBCrNxJ
	XN/+aA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1w8tjk5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Fri, 02 Oct 2026 10:02:36 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98a9344b154so158290241.2
        for <linux-mips@vger.kernel.org>; Fri, 02 Oct 2026 03:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790935355; x=1791540155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Liz2cCmaLWhV5NPUrTvM1xU6DHZve8vqyeNzJz5JT8s=;
        b=bg5DpfAEyBX0e5aRfJp9F+7mNmdDEQpvHSzvQPyBQCuL82N2Tf88Jl9SqIBmTjPm+4
         Cj8KtoygKviSs0KNQj2lwxPd0JhD6AejIrZfo+ZQlKYSgVco16Ug1OzpokaUqvc7gjcb
         sYtow9FI0dM3L4J3GEW3EjSL/E++3bS7+iCuCWMcqBxX9w4f7nIgx0sWEA/L0nAhchTZ
         W/cRQp1TlblL43Vx1ZzT+uWtKyLeP5TDNPbIAbgMxh4Hl5Q7Dh4EGeqAqiMxJDBeB8xU
         sg/2Y9e64rXvpEj/Sigq2d+fezQlSvTmQa5cn8lp91sInY/irwFHUfyIYmpSVx3Z9Eyn
         wWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790935355; x=1791540155;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Liz2cCmaLWhV5NPUrTvM1xU6DHZve8vqyeNzJz5JT8s=;
        b=Q9tWbeStVMnBNGPVODut1oqbbLH9dz32t0B2UdTWyxPGecg4kbv5R6Vgs3CTd6jxrw
         n7fYCNSWMzsvXDRO/xpasmtRoGDEJY10L0n24FQOeT5HMhROnT3nAB9NEoZ5JZlqMOEc
         m7YypHllE/1yo/JY0BDkyYOZDN3hjBr7TDfxAkR1YT4uthV7cxzFOIXWXTfk9ukAAwrg
         2Vr8HgB8O+wLtaWMBLbpHmjbmfc8wJJ/KpSU6XtAZEDGEaOhUczXMtVcQTFRgrGyiyxO
         Rn9bIpqeWW5UXX4wmMKGxGpEH7E3o5lZr+S0DjjPMry0nuUYPYQJnG0YHJXPWzYloDku
         Hmyg==
X-Forwarded-Encrypted: i=1; AKwUvByy4/eKyb9McpfbDCq8qE52qES23RxFLdC05oQXRs/nafYEPCBFN9htcdmAWeEkEBsNM3R02tobOcdN@vger.kernel.org
X-Gm-Message-State: AFq9FYIuWyPtOKAg5LYeOODvq2NyicGrMUAtcvjh1gnK8lVfRIl0V2+I
	IPFaVNJUQJD9J7WobJLZzE/M1CNF7IIkiAyxJVeLy3+p6s6WT8pPgXJJrbKTm8h24BmNY/BGY3O
	BVRsQZZjog4sQdc+IAJo5VWQgmrXIsXrIhUOtjOMGKJq+/2oLx/OMnrNQ4ZJnKuJn
X-Gm-Gg: AYBFou1ZzqJ/U/4gOXKunfkDzmZ/Hsxsh9kDa1Lv6Sr9JOJP+TP0DWVf6lhTm4KxVAn
	fzPHCeJYm+q4eRZkmV2HPHVJsSe1XK8/g/GOcw7Ty177pPiEkUH9ChaZC7b3KBhvEre+4U4ZIw4
	eh2hN4RCtDWkxivfePWW+oNI35Tri6/V2PITq2XGFN/ZdWodHh0uci1qXI67BZ8lwKiRmznwbHI
	7AZyt9wSBYztPywHq51GZSEys5RRIVxeNix2QZx8EB42GTBlTZp5qO2OW7clruZAcd6uDO4Soay
	UbD+OIqf+UE9KLWY6JtW5yLSEYTuwOM/AnyQtsPSOVpulJJUeqOnO+oSozZ6q7cScfuJfzTdxVp
	w1ignupqa216hmOe+icK/lZL118me7YMl5loPJoTBmhqaWhX92DZAf/NWxaMasw==
X-Received: by 2002:a05:6102:508f:b0:79f:5d5e:11cf with SMTP id ada2fe7eead31-7c0f4a8430amr465773137.11.1790935355244;
        Fri, 02 Oct 2026 03:02:35 -0700 (PDT)
X-Received: by 2002:a05:6102:508f:b0:79f:5d5e:11cf with SMTP id ada2fe7eead31-7c0f4a8430amr465759137.11.1790935354557;
        Fri, 02 Oct 2026 03:02:34 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:f14c:b716:c104:4712? ([2a05:6e02:1041:c10:f14c:b716:c104:4712])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38307190sm4255558f8f.45.2026.10.02.03.02.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 03:02:33 -0700 (PDT)
Message-ID: <4619ced8-b385-42e6-9c9e-0745a68c62c7@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 12:02:29 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] MIPS: GIC clocksource/irqchip improvements and
 fixes for multi-cluster systems
To: =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Aleksandar Rikalo <arikalo@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>,
        Chao-ying Fu <cfu@wavecomp.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
        Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260929-sync-gic-counters-v4-0-ec70c4b60434@bootlin.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260929-sync-gic-counters-v4-0-ec70c4b60434@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XA-DZMVjnizaQsv9gDp6wLP78ZwImcGt
X-Authority-Analysis: v=2.4 cv=ML/1C8Zl c=1 sm=1 tr=0 ts=6abf813c cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=P-IC7800AAAA:8
 a=RSNH0M3Jrif6_pYBjZsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzOSBTYWx0ZWRfX3POEawpzRI0h
 qE6bAQA2T/VDLgAffbvEcZKU9SNXx9bbXzdcebYtUMFi+/EPXQLHwSzyL//1LDCNZHX2qDYeEXq
 NVHy5YOXB5L1ZHQ9cx8SIzAne/VMbFty4z8ISkzWUkGBCQIjz/Yc9Htmb2Xn9TItiDWsRbKPDwm
 PysphOi1sDnUfDm0v9jFtNlCKaFMZKRkhj2QwuJWow8fM2uu/83WmwoVv9ndFoKvco7K52n3Ce/
 UTy/SsSCgnfwVg7gIT056FvjAxWoQn41QsEoNKv8OheN3mru4j6CtyVZQLUbQTvPC++n/B+u718
 DevrhE+lKd5ViDI/eiWKlbimOz0qnxQiWF1JiwSmMJlwXD3C5pp9gEE1XBn4aKQmw271dPqY64C
 cKxNq0KBDs41U4WjYJ9wQEvjLu6c0X5OkY1g0FL+0VfTz5Q9yAtpWEaLtj3eR5mobtnPso+OA5H
 JN51au6B3iElTqcMpnQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzOSBTYWx0ZWRfXwAqnWvvijyZ8
 5LzXjZ+/be84+F54XoKYTFXM+Y7aDlKH4yskMweF69E0tde0t320285MTQVDUKp40GEAIZfEVXu
 TGNEL/WFcfrnd49dhnxmd0hyuIzElIs=
X-Proofpoint-ORIG-GUID: XA-DZMVjnizaQsv9gDp6wLP78ZwImcGt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020039

Hi,

On 9/29/26 14:14, Benoît Monin wrote:

[ ... ]

> Although I am posting this as a single series since the patches
> are all related to the GIC, the changes to the irqchip driver and
> to the clocksource driver are independent from each other and can be
> merged in different trees. I can split the series in two if it helps
> reviewing/merging.
> 
> Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
> ---
Applied, patch 4 & 5

Thanks


[ ... ]
