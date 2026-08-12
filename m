Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3280C3B71A4
	for <linux-mips@vger.kernel.org>; Wed, 12 Aug 2026 08:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786523198; cv=none; b=pezU/0V1Eq5AfUzI9ZolV2OBpD5PjjYqlZco+AKkE56uQAKSeSme5L6112KYXRsVCCS8IvVDrgfrvU+iIfKE4YcecdoL9e6twgqm0SB16FusEccZ8/g0Zt2R6XeGfuZsvF/oDsMG5pjZsCyZGZzAt91B+ovqZQtDyy8RH8fe65g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786523198; c=relaxed/simple;
	bh=GVd7oU9YX8OD+6eUBauxRpeCoNwYRLbZuLNSBLXXiIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t0ZGOI+xfd/Ue5kMUp/GauwQpt8fvfypQbZ0ZSYbRiDIRGpNqlfdWylNJQekGoGAaBjWpPypZsx0rmiegNerK3BODNjRa4cQVmBzwD5FgxNluGN4Gs3A50C/e9DCYP7mvI4N6Nwgo5BvYOA2NiK9zqsjC6GCP5lboTrSh/BMJ/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b33ZPILU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ww66A8Rf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b33ZPILU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ww66A8Rf"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C79S4K3144260
	for <linux-mips@vger.kernel.org>; Wed, 12 Aug 2026 08:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GJdFFIibvpQHO0IPTEE/CONSQNYSEBLHc3wY9Qac/Fs=; b=b33ZPILUNYdVNzeF
	ToaAO5c4750Dy9BHdo047/e2tJj2Mh5jOjiM9SpOBbPnUr2wvo1TI9HAY8cNm/wg
	OrJSU4zDs2i+DZU3yQViAVsZcBjgS42s3Oy+zrFeCxtJmZKi0uF4m9Bv2G+yO6Ks
	YV/QJxoFIv/qj38vxXwQXyBAr+ItBPFMM7mxsf2/MCXqWs+pq4OOiS7ajKF9xPRi
	PjVCrztzMas9fNHDbK/EsbnV82QPyu5mtnn9HZ2qvUvL5q3ibEUwGLDrzi+SrFNf
	oG904570klVJqUGYWxB+IkWlS8I7i9nAvnyE771j+Ff5lagJ1wBw553nwqXnnMc2
	CNTWuA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0m6rg99v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Wed, 12 Aug 2026 08:26:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-526da7e3c9dso6807841cf.1
        for <linux-mips@vger.kernel.org>; Wed, 12 Aug 2026 01:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786523195; x=1787127995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GJdFFIibvpQHO0IPTEE/CONSQNYSEBLHc3wY9Qac/Fs=;
        b=Ww66A8Rf9DC9QspOZR/HR+vVB5jciO6ZVYUpSI0j0AW/h1BpAMxqk44PLD8VAaSaLq
         l13hppJdehaUIjSuSRc2TEpdR0Bu6ffNpKqQp1qycWf+LfEh3zYm6LbQIj/PYwXga8+u
         3pZUv2plEjhBSTRc05hlgDwnG6nDURmwNDSqt+xjPB+tgu+dlehu3RSsP4BcP3jKky8D
         UgqgMD032XXq2xmL3RKZRNMqombH0/Yci46w0WolxA/AsPCA02QEQxu0AsLntp/XkUf6
         O60BXdgG3f4MRMfOWZCE2JXIVk4yWlpLVLc8B6LDq+tpfDjzxj2bzL6vdLEFkfNPjXkA
         +WPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786523195; x=1787127995;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJdFFIibvpQHO0IPTEE/CONSQNYSEBLHc3wY9Qac/Fs=;
        b=Ur/c4yzvDdwpUWqUeVaFfpq526H863ilTHtiwca3Ea6z4QmaNiFpg907Qe+aa99lj9
         AOwan9lsyHuurU/rsqEXSW390sdL904ZVdZw9MHEw9NpyHRTyM4VTB4KjifHvOWbQ7Wq
         XrSXJcGqTAV1opvoYFSkg/VP4dIpVGWeSuOjpTbqAfS5Npz0V7vNGIMLnYE4E1GnDIfn
         LumwyX/mA9Pv3QiyCUYO8x+ja8k3Dsse8VjeRRhNultLg6oKnB/57PWCTqgd/NcreUoj
         91ZL69HK6m791Z4720asTDVVqQ3OXuGW7LOXiHMrErvs0bZes+slgl3YsVCs9y91RHTM
         94ig==
X-Forwarded-Encrypted: i=1; AHgh+Rr6QWTZw5n/ldbBmpyen/oqJG855qeOUBjAC/t26c4gKKcFgafAVKvZKBq0ttJKnak+qvV27epwONiB@vger.kernel.org
X-Gm-Message-State: AOJu0YxTgk9tLlBtte+l2qc+187fXeYnx/UJK9U6GQkCalEPb0uuIpmY
	CsbAp6Dlmlz8khKKFtJBjFJ6xdHinup598lAFumiQr5vUgdpSgz6SKdpSLr3DhCszYh7EVcvjjS
	wgER4Km3KJpHMNHwqivH96zM7bdVRby5XZtFubYwATuY8qXyZExykRwmDhBs7Wq8w
X-Gm-Gg: AR+sD12O3SYHbRqsHJZyIVOQeSGJ9UMUFB97XCT5kRMDoxd+Au7pQzggHdXzi4CGZs/
	I3RAtiK29EApwjCMDqFFkZwLcMoefMj4N64/hlKz4wMtStoUdw1pw+TxpeWDoFsILEBwyxcVQFk
	bohPUmMGOrY/ywHzxbizX6C8BpfO/jZCdL0fRgNkEYQoPokLg+1q5gHUmnLNpJ5AhmdrT3qavAR
	N049vD1fcbnlbbfvyUiEjxav8ZvIjos9ynKTKWxVcolmQff2XISbNSLVef2nZIVlhLYgrAVjNDc
	Pudhp4ZTKnvsbi3yRf0M/mBnVTw0i7iWJArtO9Mve6FmqPwQBnsZqShrq/OvRTiZw2oGzzy24i7
	byI+ZIxeDXPeOR7UN9nrcLudxGZhbuEBTm8bv74fYwIrQvfW90E8SQ2tvBOEPzcQ=
X-Received: by 2002:a05:622a:1c09:b0:527:69dd:5413 with SMTP id d75a77b69052e-52d646ba175mr27284021cf.5.1786523195401;
        Wed, 12 Aug 2026 01:26:35 -0700 (PDT)
X-Received: by 2002:a05:622a:1c09:b0:527:69dd:5413 with SMTP id d75a77b69052e-52d646ba175mr27283781cf.5.1786523194955;
        Wed, 12 Aug 2026 01:26:34 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:b467:f322:cd3a:615c? ([2a05:6e02:1041:c10:b467:f322:cd3a:615c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997ad79e5csm28901165e9.3.2026.08.12.01.26.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 01:26:33 -0700 (PDT)
Message-ID: <4917ef30-0ed9-4c5a-8516-1033b5f02fdc@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 10:26:32 +0200
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
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260731120246.1296955-1-cjd@cjdns.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA2NyBTYWx0ZWRfX8h/1zSO6BJbs
 3Jy3YoELe23T96ghbgPlv5eTogsrRoORokfGt78x7ZOXVR9bNzXPWJBVWrJ9pi2BzTU0uoeWuJX
 TJhVyvP02wwmTj2Gaw2yc7KwEwlPwi/zByHfJa0wHOtNYJdORXPUhWnF0VpJglwzRuEcsXci8RI
 /JpONbTgtNjgUm2uTkglDw9L2+tTiQQ+pG38oGdFyT/2rEn7XG9esfmz8uAWoUWI6qo4t0ceGS/
 Cmd5gmPW3A4B7HX4UmIi80r0U35CLLaYAy2nzUBKmz/KISbkq67L8f4yO3ybyvo1MpyG+GNyT04
 wA6bQP5Uan3IJx1SnlngNNj1KLh0LDQUKhTw9fUk5k4txfRZgcXQuzMn6ctNcUVNitEVSQ7GoMj
 MY0QetKhrp7Bkd49se6/j5t3zYJceq0Is0YdsHWO5l+qbNttGIrjf5bjKVtaCwJ0/tWohTQIGX9
 FiZ5g1xT+8kZ/oKeuig==
X-Authority-Analysis: v=2.4 cv=Wb08rUhX c=1 sm=1 tr=0 ts=6a7c2e3c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=Boy92G2SHH6eYtDNLeYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: y-EeX_o14DEncuoRomMp3NEnhSEDUaQO
X-Proofpoint-ORIG-GUID: y-EeX_o14DEncuoRomMp3NEnhSEDUaQO
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA2NyBTYWx0ZWRfX36DKYqun9zpe
 zploURgaKMsbRdoXrPlCBBmDSvVd22HcsTDzNcfs7CukbfpxfbuJAH9uwqwemraJXEMpzxGHcTW
 DYb7NPQCdeeB1AWFmi2ferShasucWtI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120067

On 7/31/26 14:02, Caleb James DeLisle wrote:
> This timer appears on both the EcoNet EN751221 (34Kc) and on the
> EN751627 / EN7528 (1004Kc) SoCs. On the 34Kc the interrupt controller
> uses a percpu interrupt while on the others it uses an individual
> IRQ number for each CPU timer. Add support for EN751627 and EN7528.
> Add support for IRQ number for each CPU timer under the
> econet,en751627-timer compatible.
> 
> Changes since v6:
> * Rebase to tip/timers/core (base-commit below)

Got this:

In file included from 
/home/dlezcano/Work/src/linux/timers/include/asm-generic/bug.h:31,
                  from 
/home/dlezcano/Work/src/linux/timers/arch/arm64/include/asm/bug.h:26,
                  from 
/home/dlezcano/Work/src/linux/timers/arch/arm64/include/asm/pgtable.h:8,
                  from 
/home/dlezcano/Work/src/linux/timers/include/linux/pgtable.h:6,
                  from 
/home/dlezcano/Work/src/linux/timers/arch/arm64/include/asm/io.h:12,
                  from 
/home/dlezcano/Work/src/linux/timers/include/linux/io.h:12,
                  from 
/home/dlezcano/Work/src/linux/timers/drivers/clocksource/timer-econet-en751221.c:8:
/home/dlezcano/Work/src/linux/timers/drivers/clocksource/timer-econet-en751221.c: 
In function ‘timer_init’:
/home/dlezcano/Work/src/linux/timers/include/linux/kern_levels.h:5:25: 
warning: format ‘%d’ expects argument of type ‘int’, but argument 3 has 
type ‘long unsigned int’ [-Wformat=]
     5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
       |                         ^~~~~~
/home/dlezcano/Work/src/linux/timers/include/linux/printk.h:483:25: 
note: in definition of macro ‘printk_index_wrap’
   483 |                 _p_func(_fmt, ##__VA_ARGS__); 
         \
       |                         ^~~~
/home/dlezcano/Work/src/linux/timers/include/linux/printk.h:554:9: note: 
in expansion of macro ‘printk’
   554 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
       |         ^~~~~~
/home/dlezcano/Work/src/linux/timers/include/linux/kern_levels.h:11:25: 
note: in expansion of macro ‘KERN_SOH’
    11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
       |                         ^~~~~~~~
/home/dlezcano/Work/src/linux/timers/include/linux/printk.h:554:16: 
note: in expansion of macro ‘KERN_ERR’
   554 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
       |                ^~~~~~~~
/home/dlezcano/Work/src/linux/timers/drivers/clocksource/timer-econet-en751221.c:201:17: 
note: in expansion of macro ‘pr_err’
   201 |                 pr_err("%pOFn: Too many IRQs max %d got %d\n", np,
       |                 ^~~~~~
/home/dlezcano/Work/src/linux/timers/include/linux/kern_levels.h:5:25: 
warning: format ‘%d’ expects argument of type ‘int’, but argument 3 has 
type ‘long unsigned int’ [-Wformat=]
     5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
       |                         ^~~~~~
/home/dlezcano/Work/src/linux/timers/include/linux/printk.h:483:25: 
note: in definition of macro ‘printk_index_wrap’
   483 |                 _p_func(_fmt, ##__VA_ARGS__); 
         \
       |                         ^~~~
/home/dlezcano/Work/src/linux/timers/include/linux/printk.h:554:9: note: 
in expansion of macro ‘printk’
   554 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
       |         ^~~~~~
/home/dlezcano/Work/src/linux/timers/include/linux/kern_levels.h:11:25: 
note: in expansion of macro ‘KERN_SOH’
    11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
       |                         ^~~~~~~~
/home/dlezcano/Work/src/linux/timers/include/linux/printk.h:554:16: 
note: in expansion of macro ‘KERN_ERR’
   554 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
       |                ^~~~~~~~
/home/dlezcano/Work/src/linux/timers/drivers/clocksource/timer-econet-en751221.c:206:17: 
note: in expansion of macro ‘pr_err’
   206 |                 pr_err("%pOFn: Too many regs: max %d got %d\n", np,
       |                 ^~~~~~


> Changes since v5:
> * Integrate patch fix refcount leak from:
> Link: https://lore.kernel.org/linux-mips/20260526184105.18962-3-grandmaster@al2klimov.de/
> * NULL econet_timer.membase after unmapping
> * NULL check dev->event_handler in case clockevents_config_and_register
>    failed to fully register.
> * v5: https://lore.kernel.org/linux-mips/20260516233943.49502-1-cjd@cjdns.fr/
> 
> Changes from v4:
> * Fixed incorrect compatible in DT schema
> * Bracing in out_irq_free if statement
> * I did not move cpuhp_setup_state past the point of no return
> * v4: https://lore.kernel.org/linux-mips/20260516215720.4160831-1-cjd@cjdns.fr
> 
> Changes from v3:
> * off-by-one in out_irq_free
> * Gracefully fail if too many address resources are provided in the DT
> * Allow fewer actual timers than num_possible_cpus, as long as they
> never start
> * v3: https://lore.kernel.org/linux-mips/20260516182648.3987792-1-cjd@cjdns.fr
> 
> v3 note:
> 
> I decided to take this patchset in a slightly different direction from
> v2. There is a certain amount of initialization that once it has run,
> it cannot be reverted in case of error. The original driver init was a
> mixture of revertible and non-revertible code which made it too easy
> for code which is designed with best practices in mind to in fact
> introduce a bug. Therefore I start by making the init process more
> legible but without any business logic changes, then fix a race
> condition by keeping IRQ disabled until after cevt is setup, then
> finally add non-percpu IRQ support.
> 
> * v2: https://lore.kernel.org/linux-mips/20260514000601.3430262-1-cjd@cjdns.fr
> 
> Changes from v1:
> * Split changes over 3 refactoring patches + main patch
> * Remove driver discussion from dt commit message
> * v1: https://lore.kernel.org/linux-mips/20260416175101.958073-1-cjd@cjdns.fr/
> 
> 
> Alexander A. Klimov (1):
>    clocksource/timer-econet-en751221: fix refcount leak
> 
> Caleb James DeLisle (4):
>    dt-bindings: timer: econet: Update EN751627 for multi-IRQ
>    clocksource/timer-econet-en751221: Init teardown on error if possible
>    clocksource/timer-econet-en751221: Disable IRQ until cevt registered
>    clocksource/timer-econet-en751221: Support EN751627 without percpu IRQ
> 
>   .../bindings/timer/econet,en751221-timer.yaml |  31 +--
>   drivers/clocksource/timer-econet-en751221.c   | 181 ++++++++++++++----
>   2 files changed, 159 insertions(+), 53 deletions(-)
> 
> 
> base-commit: ecc330e3096173f433659aa64ab3674d0d48440e

