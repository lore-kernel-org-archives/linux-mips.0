Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7F032B130
	for <linux-mips@vger.kernel.org>; Thu, 30 Jul 2026 08:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785399117; cv=none; b=FUiQRYLtsfAu+2h8sy1sN5ch+dpmxm4NN7LvyBmS9CnVENMcyehTP+VisE6wp2obGnK9yv6m0ZFOzseCiY6mWb8YtP/X7LIroOhL9AeZ3nnn4Pi/j8kVPP8C0rUY2UbN7ASitX12QEm9fII57khtXF8nK2gLUaFaIsiwdKReaOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785399117; c=relaxed/simple;
	bh=4QPs/GUSJjXu3SMPCjbKcTjBPS5rwxyVwdUg4pQ30iY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k2bD2HqlRcBL1ghbk7gN8THTuFdnDvPPAWFTVl3QqFrLhaRzGtQ27X5h/So2m+VQG+UwDL7px57ceUnp/+ZUvWJX7Jhpg46BdDkj/odHUr+mU6ADyQwdawu5/Klip+icIcMHj3JmrSqEuC717+VWOJviEh494P/xJZKTP2dLeF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZPL/Ov1P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KFW8n0Na; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZPL/Ov1P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KFW8n0Na"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U82aYo1385290
	for <linux-mips@vger.kernel.org>; Thu, 30 Jul 2026 08:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u9UFoU4lYuyMXLSPiV/x+DNCpef+k8Qmi5vfYkwQM9o=; b=ZPL/Ov1PXckxn8rI
	NpElNpwLo67PAs0zeonbcKC0BDgiL/ZZiXMHP0TXWGlqOVfV7QMGGO95iSKcrdQ5
	ZKL1nVoevIKFgkVJD7WNWSlbvivpu+fSx4OUy15+8YIbD6Zee14vPbn5J7k7dGe8
	mj5Pw8aeJyZqjGxKItzQ1YFc81Nbamijpz8VFs9j0X0oCV5EO14Y3rthrkc6dzL3
	n9eqJlUbIoVtGTg4m9f4qZGqt0t6/SKtHSSdfLDvj4CZvXhWzhSufSr4d0jVIuFj
	5JGtNFoZKlY2MP9VLP8ui9OACbBP4kTW1VxDHCOumgdq0vILe4yO+RJpamY889Sn
	hlpzrA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr2rp01fj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Thu, 30 Jul 2026 08:11:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91931144870so197832185a.1
        for <linux-mips@vger.kernel.org>; Thu, 30 Jul 2026 01:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785399112; x=1786003912; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u9UFoU4lYuyMXLSPiV/x+DNCpef+k8Qmi5vfYkwQM9o=;
        b=KFW8n0NanEwlDaZh+rDG5V3cQvbHNq4DqoUQD/u36xu5+i4qMwZ22VZ5BOzVS2Oqu+
         gs4eB4YYNKlgknGpVD2NcwXWqN0w4EDKSoetbpa+yt8S5RfmqXMq4vdEx6re3G9sqk16
         WFCX8q0BwFG6b6kB1TtNXOCzpKTr0668XlpJBRmfCii7lrIlu22/dw12TfUekSkMiWFj
         5L38WptPBS2pVp1GYEhEPA3O1LZIX+Gss6ZKKO7fGCaF/yT0oTaMM6TvPlorFXMKeDq9
         GG+q0gGUr+Es1mFa6Cm73fGCI1RChAnunipsUKmsJliRnxDzIKpEHJVRCDbhQbl/vu5G
         Cemg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785399112; x=1786003912;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u9UFoU4lYuyMXLSPiV/x+DNCpef+k8Qmi5vfYkwQM9o=;
        b=tRlBYsxB80ab2aosP85k6m83LdqWRlEpo1qUo/exAreO2Gpa/2xyxxAvwzVsWnrl5C
         6koiFAvFLKhSJ+beNtOelnyQcUIkiTrCvZVNHNkSd31L1RGZWZMN01q9AX0r1bDMLp51
         sLYtFgsN2JkahrnHwdE6QXGe5VrBhdK5x8AuJHg9Z9ctfZKG4g0QJIpTS8Bq/ElP8fbr
         d1FQZYsZuPWs34DXDgarZtmDsQUg7xAPiMsTjL5TsO2zd82j22ZgMe7c0CmCDpP44jTE
         3IYRrjLosR98EMW4tr4Y/R4TVo9cIAmKAyHoGr9dTF0hsqIEg9RxkumTS6RRFTs9QkW/
         I4RQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr1ksEjtCUC1AFyR2VyaLh+GrGPzgvw/DEb4lkyIDN3B91qEZ6Fo08JmnSn2kIBR2FBBdZrGU8a/+4i@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmkrpzj5tERYtNsov9nxg1xoR3TAuXhrYLUT3280jOqRlY6lP5
	okTFhLKyRoyREyc7lmWKjwMONtkWQrfLz3elIulYTF95P+hiMjmbmYmOwPDnbkprEnGM6l0dmp2
	SqAILWk1p7C/BhBcpeU+MgiZwWMfPJgYDXf84dD7eiE0mHqXtI8GJdOYgU/n1K+rz
X-Gm-Gg: AR+sD13VEo0qViYIPYDdeEJ/u1IhVc5XbvCaL5lkg+Oq77Hhh4cytdpR/D2KcOU20Yx
	6dbp++FCIJDpPmHFCUP1mKEU0RdeHktilJv85i8UFDWKOIvkFPcPXC+4eQFYeaDk1FOt8zsIeuz
	jLyC+RumCxR93xTnAgMD7HN01VDS8FMtHTdok9viCMpR6ifgnd7ODIXCugDSregBkeAgSo3RkhX
	rX6Gi0xnJoTFIKXlcVvgBkHRxnQ/KPFNYg+FF9OlPewQ4eFbL0GS4rdJvOJp8NsMSC76vcyzBb3
	MFP7jjHmcMrywbbFkxy8nDn1/vgWIsShie7uK6FyNYyh50tCb11t5NwIQ6cCsqWD3fkgEMdSNl8
	5YybW6yQitNnPkPnjQjjmT+sikbstza8vwR/KA1GXYAJxxIjKx7k=
X-Received: by 2002:a05:622a:5910:b0:51c:1967:5091 with SMTP id d75a77b69052e-52b3866dd5emr18473401cf.41.1785399111533;
        Thu, 30 Jul 2026 01:11:51 -0700 (PDT)
X-Received: by 2002:a05:622a:5910:b0:51c:1967:5091 with SMTP id d75a77b69052e-52b3866dd5emr18473131cf.41.1785399110956;
        Thu, 30 Jul 2026 01:11:50 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4980120b42csm39840115e9.10.2026.07.30.01.11.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 01:11:50 -0700 (PDT)
Message-ID: <8ad47516-2747-45d1-ae25-e9ce068b7f3c@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 10:11:47 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v2 1/2] bpf, mips: Factor out div/mod emission
 helpers
Content-Language: en-US
To: Nicholas Dudar <main.kalliope@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com,
        memxor@gmail.com, tsbogend@alpha.franken.de,
        johan.almbladh@anyfinetworks.com, paulburton@kernel.org,
        martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
        jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev,
        visitorckw@gmail.com, bpf@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, martin.lau@kernel.org, clm@meta.com
References: <20260729162931.2369353-2-main.kalliope@gmail.com>
 <c517c61555d5ac0e7dda77c6f9a4e3624ef8ed742d6372ab3d5af4879291ec4f@mail.kernel.org>
 <CAJZwKkjS6aREL7zSXp-4XDL7aHjCmLpUFOyO8nPAiJMUtBgSTA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <CAJZwKkjS6aREL7zSXp-4XDL7aHjCmLpUFOyO8nPAiJMUtBgSTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA1OCBTYWx0ZWRfX8ZsIDiXDRv7r
 jLe+h4f8MV6qT5XLXA4JO6epihNb/kuqiwkXAOirtZ6v6VbkiGZ4/AtpyddblcmX1HJsyQ5nsq/
 Q7NrmdYgnPc6+K/1yHKDnCknCjsR5uE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA1OCBTYWx0ZWRfX3NvLFIoRnlOo
 Sizx54gjabF2rLBgaSkioZXuFO0xQ+Y0DH2t1j8KzUD1V7tcA3Bz4LicCUVW8O+mVoHZV58pkdN
 vN/gUQdqaPTU9VD9ppwo/gypYk9pM33iLdBN0x+g/0pDeKdwpvioHlIaRcrvkoVA26e8Po/ssYR
 JVgAPqdQE2Rx9UMBRXW68D4N/daXS1y/DYXx1SbE+k6ncBzRvoTaaa7B0ZxSWF4oqYT5R4K4ZnL
 AwVdl5FKPG+VIVfvllUPIKPjbVODtP0dHx0kSDGyyvHdhLjJ337ScH54dulyIzfjHQS6fkGc+sl
 0zjRIIuvmyA8afHGH46OZw2YR+wXgWiYJsD1ma4K+IwI145HdX4lESofhWy+5mtZ16fCD1MoPOQ
 zSpJZzKkm8Eya3Kg5JllMS2R35kkyW0aznWjvJp86GoVyZ4MmKcMv5ZhGyWjZWShicY3tZcPThM
 lnMKQYXLWeKehGz1JCg==
X-Proofpoint-GUID: -q1ZoOAjM9y7aC1-zasv6RpRgpgaMKjn
X-Proofpoint-ORIG-GUID: -q1ZoOAjM9y7aC1-zasv6RpRgpgaMKjn
X-Authority-Analysis: v=2.4 cv=OcOoyBTY c=1 sm=1 tr=0 ts=6a6b0748 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300058

On 29/7/26 20:54, Nicholas Dudar wrote:
>> This isn't a bug, but would a short header comment on emit_div() and
>> emit_mod(), in the style of the neighbouring '/* ALU register operation
>> (32-bit) */', keep these consistent with the rest of the file? Every
>> other emitter here carries one.
>>
>> Same for emit_div64() and emit_mod64() here.
> 
> Agreed that short comments would match the surrounding emitter style.
> I'll add them if the series needs another revision.

Thanks for the v2.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

