Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3552F43D502
	for <linux-mips@vger.kernel.org>; Wed, 26 Aug 2026 14:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787753628; cv=none; b=udHHO0IF2QFl4h4g1hVlybwQ3bNYuG59xqnhUvO9LKpa4HzgASSOffcSMzLeL/hpkpScIsLIDo8jCPPUuseqUXqJVckVNVG/LrdVe5aF5WIw3673Fv2qU6cQ/Nopbmishki4c0UsYAdp0FE1uIT/BZuQ8YULd//V9ahOGfyeZIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787753628; c=relaxed/simple;
	bh=IUcNzTHy3wT2qcJQgNjlntxMIsoy4CibauEbkAvXCDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cz8AeHpTg9lJD/xg8MLmGPy2k/KLu2cUvktb1GdYSE5Rz0h69d3TiwfBz1YCDomGZBPDtPtxGRkzMYYMbnwwIsXAl68o7fZnHlsC8xeDczL7yfblZRGERqrgpPHAvaHCZdTmecqjfwohkO+IBn0pneDcBKrtuuJGEjIqCBdozb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FaBJQy+s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WjutFRz+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FaBJQy+s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WjutFRz+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QDv4a8026456
	for <linux-mips@vger.kernel.org>; Wed, 26 Aug 2026 14:13:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N42qRw68pisAkSMx+a/fTTqRlQcCyUKQ3UbvKZ5lmxs=; b=FaBJQy+sn1Nt1ZUr
	WxZHdm0HH3f0GBYIEuRJ4qzAbvAVzcKYqAg3ooEoE8FeaL+P6kTOaqASDCx4j6Pv
	9AlEN6/QCt3blvrK/+xbVPUIK+kMdYjKoZ9H85o1keNhhBE+6uK2eX1FcgHbnCk1
	Day4gmK4ErVMH+LnsLOkmcB54legvIOzPkx2efKxAgezTvDk3Fp7fxhQ0Qlu2Yas
	l/mxtNBcO50St8vS/r1qobZEZeEc+jVE7rtwQ1yOE1MjzPe3drZOgtCVf9zEqy2t
	IDVet77Dtri1fme4DZq/KRK6EDzPCy61edjTMwFzM7BFbeFVGIZmOYN7MCrUztH9
	TSUwOg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9wmqs2vt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Wed, 26 Aug 2026 14:13:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e25e4b41cso2012054a91.0
        for <linux-mips@vger.kernel.org>; Wed, 26 Aug 2026 07:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787753626; x=1788358426; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N42qRw68pisAkSMx+a/fTTqRlQcCyUKQ3UbvKZ5lmxs=;
        b=WjutFRz+krrIlQjIkE3F8gieaH9s9hDX326V0VjlCQXVsU3oO5LyLqwN8azpaH3JGM
         +ZpqAebrJZQKdoTOxCVuHZ3cu3d8ObYjgYmglKyKZYlzmp78c+QUpIHpxz8E9ItlSQAD
         uBWi0H4vg3vm9hV5OjfBgnhgY7uyQApzFN/TiHXlQVuvP1BPpdYQqRamSfGLfA7JFRFq
         /WlPuOX6bhKhY4tw0jUTtt+bEd85A4gvcDfZFKqd85eEQvNHDOA4w8fz/0rnUSHiH5Fb
         LjFj0SlaTEMCfiSUGnagJ8FeAuWdAo2LUUmbRuUHhF/yfqAKsi2hN/NLzsNwt0LIPNt9
         s5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787753626; x=1788358426;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N42qRw68pisAkSMx+a/fTTqRlQcCyUKQ3UbvKZ5lmxs=;
        b=gl4KM1A+GeyGmVEPNCDkM4p5t1LJW1fbbtQZ8u98seCwgjjoAMyc45QuQqJrogFasZ
         gP2doQxKBnY5Zy3IsEt8RnMaQkDPRt8ZY58crLVK/J1r1fEHl0ks2m4StVxuY3277cpX
         p6T5NQOQejwB9FQgdQVI6oVDP3KVIyKNXlRlmYNBbcP4PWubm3p1wE2Ady5LFKcqi2Ls
         45sQ1AzKF0aUaEWkrWvue+CLtU0cAprBU+rLPKwi+FYBibJcqEA0Z3MdXopx2INbAE7V
         tp4n+bjGp4zZELTa5YfD47ZWt+yvQSHLutTeCRQMX5HvlrlnS64T+DLE7ry6oApKsUW+
         cUkw==
X-Forwarded-Encrypted: i=1; AHgh+RrzfXiDOk5Axjwsd1JR5C/gCdAt9IJWIf1JeNS3Yq7dv/Ray14q1nSgzSSXRrqVUa/qxwnXfLJkn+BB@vger.kernel.org
X-Gm-Message-State: AFuF++mk2wptYeHmb9HhzOHBHjsxGfYqy20JuLPiK4r9K5MltsArfWE/
	7tkDejeyAlYqCxZTuVX6+QkOu3U0fSKe/jmzCztB7gSIbqkK0xdJ6D3zF0xCcHO/J6YtrThdqbq
	1+r9xW+jgJqRhgmv+oRnJ+5Td4izezYRbFsyELoZWbIvauAmWR/nCs6t6cwMjvBTd
X-Gm-Gg: AR+sD13vjZTOSO96cnEB98SheZdgVhVp8AqjK8sgV0MLRSh9WxBVe1QWZWpuwHDu8Ud
	SstmWrQ7OmyG2duLBKHchUwsDr2qjq8AiXemCoVNFmzsaCqdm0lDxY/JmaShHjTLnLg+Zwg+kkQ
	hG+5j4xTL40F4rwv8he/VPB6y5ODTcy4yGAkaizV2YwWXWC1Taq2GWFV8co5rsaJyGkdWjJFTV/
	jN+et4j+rs9NjuOyco9FIxlzdIAHk4/arANDxAPJnoPDTQAL/81oGYth9eAF82P8mcpSFoitXDH
	S25c8Vc8is3HP8BTgTCj/JJa6xRkK589Zv92JG7yHapiMp73hLcUKaYsOSeG/H4iGdnugW7x5Bp
	jzXKtzMjFy0PFRh5YBA1VTLfPsSOni/IrB6QYs0fGuguq93HvhuSFvXohTF3L
X-Received: by 2002:a17:90b:3908:b0:396:54ba:8932 with SMTP id 98e67ed59e1d1-3966d5f90femr14020055a91.16.1787753625577;
        Wed, 26 Aug 2026 07:13:45 -0700 (PDT)
X-Received: by 2002:a17:90b:3908:b0:396:54ba:8932 with SMTP id 98e67ed59e1d1-3966d5f90femr14019921a91.16.1787753625065;
        Wed, 26 Aug 2026 07:13:45 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8f467c9sm8590148c88.7.2026.08.26.07.13.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 07:13:44 -0700 (PDT)
Message-ID: <7eca1c7f-52d5-43bc-afcb-1f6ac198e391@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 07:13:41 -0700
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux 6.19-rc8
To: Guenter Roeck <linux@roeck-us.net>, Paul Burton <paulburton@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mips@vger.kernel.org
References: <CAHk-=wjxkZx7-MT_tk=CxbtvPLjZtrSvcL+muUZAo3GKxBiaqg@mail.gmail.com>
 <f817c158-412b-4fd1-9941-9c2ff421b91a@roeck-us.net>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f817c158-412b-4fd1-9941-9c2ff421b91a@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExOCBTYWx0ZWRfX3W/hwVdHjevQ
 wFE8ZG5DHdMnvkPk7EDw0x/W1JkeUtLygfyYiRB1/tZu9RBUs7o1FFNvMxvYTH3gbzg1gdCmzW8
 KaKqYNMoh8jERNCAVqLUt1GAW7IjHc4=
X-Proofpoint-ORIG-GUID: v3U9vUNphKjDok-JwE3UlFejTo0uoJOp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExOCBTYWx0ZWRfXy3hUjViEkLgG
 PyyM/10JVBusl9BbU+0+7+OUcYeIXsg95877MGkP71eDiL/YL9i3u80ROPPrdqeyZIi3mv6bjhi
 skGo4wN44csRRXWD2rQMna3LQLwwLrfWI1QPcOpnGeAXMjpJEUkE7JUzjcJBzaG1q9MOeDeInTW
 sKEa3jBAeljsHy01ukxqNING8OrDZ7i0HoXqkkaqd6Pk6MUI+yQa4JXHx/x9V5cglZ1tXFVIJqw
 UHeu+tce2/CedZaIjs+fPy3dJqxojd1bCtOHXrctq8rUaXN4f7alPo0e/uFa/w7NUUWXIwrOVzI
 hPwbLHsLOhBmiq7hIwpLw/KRd73GWp9G8hWvoVHPIGul3OKID2XV4/UL1rWljTdcUZY5BmTNtxU
 oUhw7I/Il/YRi9jzRIlAc1qu4oHJb5PJbuG4ykHyATRAHd0rsO3daViT8dHqiuLwQsj8hWl9ZFQ
 9FD+d8l4hgVk5U4KXwA==
X-Authority-Analysis: v=2.4 cv=T9S8ifKQ c=1 sm=1 tr=0 ts=6a8ef49a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=ZRRb8Y5EZIRNeyjAlFsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: v3U9vUNphKjDok-JwE3UlFejTo0uoJOp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 clxscore=1011 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260118

On 2/3/2026 6:16 PM, Guenter Roeck wrote:
> mips:allmodconfig
> 	Building mips:allmodconfig ... failed
> 	    Error log:
> 	    Error: configuration 'pcb110' references undefined image 'ramdisk' in property 'ramdisk'
> 	    Seen with Ubuntu 24.04 after recent updates. Not kernel version
> 	    specific (now also seen in 6.18.y). Apparently triggered by a
> 	    Ubuntu update, but I have no idea which one.
After a recent Ubuntu update I'm also seeing this build failure.
Is nobody else reporting this?

My AI agent says:

This is not a kernel bug — it's a mkimage behavior change in u-boot-tools.
Your system recently received an upgrade from u-boot-tools 2024.01 → 2025.10
(Ubuntu 24.04 noble-security), which included two upstream commits from June
2025:

- tools: mkimage: validate image references in FIT configurations (commit
7a8b25a)
- tools: mkimage: propagate error codes from fit_handle_file() (commit
21705d3)

These commits made mkimage strictly validate that every image name referenced
in a configurations node actually exists in the images section — previously it
silently ignored undefined references, now it errors out.

The offending files in the kernel are arch/mips/generic/board-jaguar2.its.S
and arch/mips/generic/board-serval.its.S — their configurations reference
ramdisk = "ramdisk" but no ramdisk image node is ever defined anywhere in the
FIT source. This was always technically wrong; the new u-boot-tools 2025.10
just enforces it.

Fix:
Remove the stale ramdisk references from both ITS files.

I'm very hesitant to modify MIPS files when the only reason I build for MIPS
is to make sure any patches I process don't introduce any architecture
specific build failures.

/jeff
