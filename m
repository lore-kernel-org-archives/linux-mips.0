Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AC2495538
	for <linux-mips@vger.kernel.org>; Tue, 21 Jul 2026 14:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784645027; cv=none; b=R1yAaTW0Dp4fOHA6UTCfoi9ergwe3jRIgd3g/JKn3zJW8U1QF3Z3iW8oiqehqJTs3PSuCLclmwykXTxnOidL1IEj63YGKqCHXjHi3th62c+5AGIflnowRaIvpfPbPOLlJDL5is0IAba4gqW1e3GXxfj3uRzqWzYLCgFiq4ai02I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784645027; c=relaxed/simple;
	bh=H+elkluT+bh7f3Lom3D96bPujFH+/0TOV7TtxDPB2pE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=LF5rurJZ7L7x83RdBXPXNpi+v5kqgiK1yWfFWneXZQLOh5s5uqJu8Bz0TwfgbLm58nwatfXE2pTODm1j+csCaz6BXTvhBnAFPFRhMnUS5fBkYyl6b4Lr3P4QzHXbiwDNB7ViHnN7FMaCjWv3owchvL/zD1hHVyQeQHrudGQyjVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YOUGZWtL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C6XCtz8n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YOUGZWtL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C6XCtz8n"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg3VR1805590
	for <linux-mips@vger.kernel.org>; Tue, 21 Jul 2026 14:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CFqhhaVCaartYA4Fn61c9DlWaNBi6yNBTGNVvoaUsuY=; b=YOUGZWtLBX/jkDP2
	raVbsmNYFbBbDQAeXqXc4xDYtseatGrfDZ+EU/AIiarVIwHe8xxIRM4xKwtm+LZg
	RBST/THGsjXfJmkLsxgxF2c0BqNu3qsVmDLlRMcGhTvGFDK6wwMjhEhVfusUTbwK
	tZs9gGy5kJXfN61Ay4xG8z8gAbH5TTtuAXKVA+rAJc5Ak5ZXx7VLfvVa56Pdq5qd
	y9VILhlEs7NofcTsIU02DPDOU4Tswu2iaeLziAwuA3OFdpDL4msX8qXRet3pbKZd
	m9KTuPrsxdnd03re1Otp9e3vRMEqU47oeNr6Mk11xGe0+Jdqqi5qP1pegzlB3QpG
	miWvQQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6pa9989-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Tue, 21 Jul 2026 14:43:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c21c01cf3so177690941cf.2
        for <linux-mips@vger.kernel.org>; Tue, 21 Jul 2026 07:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784645024; x=1785249824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CFqhhaVCaartYA4Fn61c9DlWaNBi6yNBTGNVvoaUsuY=;
        b=C6XCtz8n/4Ejezr3lbo/uOvV/g76a/ZVP9y1QILhdIk+i1EuDoF+suJ/BuziG12Hvn
         G7jHUU0gqr24wNh9OtSu5G9d87vCB0XEiJVZWNapydcwsiVNQJGmNzRIh3KuFMayR6lT
         7stAHjyvcB14aaQvkcE0UynW2hnGqThfEhMUMtffZXxROIHqDjygdX9l/T6CqBk1QhjT
         MlhVY9GOiY6ZYEQ7kjh7g9SO7UrufSDl/8L4a2S8tP99uxRARZKObf4tMUWwdvuCCz2O
         jR4C6vRb8KN+jD1D9okhveXHrTXI07mMEywRYwTGcAjDhiIUiiIDaFjW5aOHXwl4LmRs
         fCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784645024; x=1785249824;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CFqhhaVCaartYA4Fn61c9DlWaNBi6yNBTGNVvoaUsuY=;
        b=X+83gQ87ShEUuD9WXeXwMrW5WVDcVgC/g1zHI3LM1Yd/nlrmlZzMYbATXxZwX2ST19
         bVQACz3HjswxbNlU/rvwdtRxH+pSbLq7Cc4CPE4dhZHfRcq1GhWP/A/s0L6sDLT1mpBW
         4WtrfKi3X5LaTxf3bIFyM1vZpq6XzVtxPeA2yBjyi3jYBQWx++6/y5acG8Pn1lXvyRrY
         iWpvTQ09n/ySXHLXsi38+y8w/oj2aseYv+iCLPNAdTS2en+wUr317q7KDkiLAZyYCTxo
         eDj2WLJ32K594QwF3sAT7PcgD5vMG0rpo/cE8zACQgWVBd5Bg5HtXPugBdn97Ksg8b0R
         MhsQ==
X-Forwarded-Encrypted: i=1; AHgh+RrjhCnUcOaw6O9hQh9gkddQkY/4k92xx900QTSU16RP+4466BQTnm7Rq1JEtSrHswZooO5cLXBgnO0R@vger.kernel.org
X-Gm-Message-State: AOJu0YxfqbDVXd4kOmE/VtgGGMdPYlZIDXl4ZcoFKGYXAkistbRGAKIh
	ESmku4d9YlqPq1BTy+45nhytkgap/Q6+4S0GMAjBRwwkFY0MWEodUMTSXNtB6R9C/inJwKr0fKi
	Y5nccbqIkA6JPFQMMgd1rYzUdcqia0RwTg8ezxb1K+VN8RUIiAxKHyi/0psC3lii8
X-Gm-Gg: AfdE7cljnKn4mO1tNi/IfHDJuKL8M2sUi5ZGiYUTRkp5UX5qXmqIPdyCkRFmgt4mbCK
	x68IozK9apYEZmfkCq95Pgq5u1kwRb6E2egscPtsif1910jjk1mhxqmuQF8Mcg9qSK0L61/+L2g
	BUAQHH+TZqt29wsjWFXJAPkzCoplES4JkgF/kAFGZKWfi8a0LRzqtSU7cj+1zGloIx5X5JVS6ao
	NVcQTBUm2y1I1KhnB0tFDj7k8sgX4OHzIWS06N3FpO1utYYHW3zUueuOIwcXryiyCPemoo2tIXp
	TeE/spvQFrHexUmFsxfHfbgOu8ghH7bnbSdZmvgOf+Ots1y3S7vzHwt5WiHOfXiPnqngyBE2hJK
	xBCXo/Y4oE3LBbGmrFH1Z5/ANwQcYM7wJAn0btBlNLVwI/KGNBpg=
X-Received: by 2002:ac8:7f47:0:b0:51c:7b12:121a with SMTP id d75a77b69052e-5214064a47fmr185901681cf.88.1784645024308;
        Tue, 21 Jul 2026 07:43:44 -0700 (PDT)
X-Received: by 2002:ac8:7f47:0:b0:51c:7b12:121a with SMTP id d75a77b69052e-5214064a47fmr185901361cf.88.1784645023910;
        Tue, 21 Jul 2026 07:43:43 -0700 (PDT)
Received: from [10.131.142.220] (220.171.88.92.rev.sfr.net. [92.88.171.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49564011868sm86680545e9.3.2026.07.21.07.43.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 07:43:42 -0700 (PDT)
Message-ID: <27072da0-124d-4a87-b037-f56320c8e97b@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 16:43:40 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MIPS: ptrace: Fix syscall skipping via PTRACE_SYSCALL
Content-Language: en-US
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Oleg Nesterov <oleg@redhat.com>, James Hogan <jhogan@kernel.org>,
        Kees Cook <kees@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20260717112731.59254-1-tsbogend@alpha.franken.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260717112731.59254-1-tsbogend@alpha.franken.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8vHoh-Pq21eMno05nu4Bvfp-Iqssz_Xb
X-Proofpoint-ORIG-GUID: 8vHoh-Pq21eMno05nu4Bvfp-Iqssz_Xb
X-Authority-Analysis: v=2.4 cv=eYYNubEH c=1 sm=1 tr=0 ts=6a5f85a0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=HvFMDRKYglX6yPpWI6gtsw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=GnOaF_wXYiqghGxwzfwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE1NSBTYWx0ZWRfX3pGkwrAfWrqX
 fgpkKNuo0B78BCiq8NGsqiAM5N/1gN55jItQjdd7aW+qwyL9ND/YaDch1YOthGMbpvcpXEjg1kt
 qwb/9wh9H+Phwa92jgRAes/pitLkw1/zg3ovwTkKUNp3jGt8zd+1aY496crjacJ8PMvvCGtOwQr
 8O7v4KZopWw4iVEag++QAHGZQKIsqJQGdGkod7sQLL4BiV7kIwUr2kCdx7ws29dJFtENhOUsi29
 Y1URWMym65QMFWGv5Gf1RDhTK9MOM3e/30xpn5QPPPmYo6OWfchY55Ownc2pHg5mqHHXVgPMm8G
 WFmRDiu0SAoAFCpLoUzBvHYy8/FN6pAkURfLfVrjAE46hYTbcKzg1bPfIwL+QiWnOMVNm8yBa30
 YivYBTrFGBj3jFmr1Aj31KM3BYoe8hPG1UtsNXCU429cg8vAUzx4P3P45DigxGOWTjGLUZIvvqH
 e31+y7zsW9D7OJOnBkg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE1NSBTYWx0ZWRfXwEVsM0QBIFrL
 BYu5xF2DCAWZvt+uv3ScmtRpT64WVMt0EYGFrmA/8I7yEp+OhYqN+0SyeNF4z9mtHDfp/Amgx8P
 M491Twyke0PGpro+IyQe93+nYTboaGc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210155

Hi Thomas,

+Jiaxun

On 17/7/26 13:27, Thomas Bogendoerfer wrote:
> If tracer wanted to skip a syscall return value was always
> overwritten with -ENOSYS. Fix this by checking against original
> syscall number and only return -ENOSYS, if it is negative.
> 
> Fixes: b6318a903d06 ("MIPS/ptrace: Pick up ptrace/seccomp changed syscalls")

I think you meant:

Fixes: 4370b673ccf2 ("MIPS: scall: Save thread_info.syscall 
unconditionally on entry")

> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>   arch/mips/kernel/ptrace.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/kernel/ptrace.c b/arch/mips/kernel/ptrace.c
> index 3f4c94c88124..87102a03b6ea 100644
> --- a/arch/mips/kernel/ptrace.c
> +++ b/arch/mips/kernel/ptrace.c
> @@ -1321,8 +1321,12 @@ long arch_ptrace(struct task_struct *child, long request,
>    */
>   asmlinkage long syscall_trace_enter(struct pt_regs *regs)
>   {
> +	long syscall;
> +
>   	user_exit();
>   
> +	syscall = current_thread_info()->syscall;
> +
>   	if (test_thread_flag(TIF_SYSCALL_TRACE)) {
>   		if (ptrace_report_syscall_entry(regs))
>   			return -1;
> @@ -1342,7 +1346,7 @@ asmlinkage long syscall_trace_enter(struct pt_regs *regs)
>   	 * Negative syscall numbers are mistaken for rejected syscalls, but
>   	 * won't have had the return value set appropriately, so we do so now.
>   	 */
> -	if (current_thread_info()->syscall < 0)
> +	if (syscall < 0)
>   		syscall_set_return_value(current, regs, -ENOSYS, 0);
>   	return current_thread_info()->syscall;
>   }

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

