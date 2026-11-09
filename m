Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246237;
	b=JjZoymQaN7AjTBUXcD3wyr2VVhk8S4uEhqV7nliS2baOvX/eBrrt1kYylz1xEic0ZKMY
	 W9oGjT0/BK7HMyoT9jGBCjalb9YOyjeNYs0jv3ZrLwM+00Cz88DdLtUS42y19pYjF5NrG
	 isHhHNWfHjhhxdGpGHcVCKibnZZ8AfDJbxXQL2s8cODua7k0R+o3KrpuBW3VGeERekyNe
	 3N0quK2EN4YecZeo+ZdXJdoCEVe31yfT7d3ajuxjDP+oSqwJEjdini3k2DHwhnPnRjALW
	 Qv9vSiUnd8n0d6Ma+8jsl7zgUiRTHthlNMhYtSCSQNCKh6Wpb0jxDgW1nqsutWi5x9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ODDsFkmR4JZZjzffhsKtiZTywC4t5hT17cOUsHgNWAg=;
	b=CN1phSiaoAkp7V6fTp2zKlO0knsWLoFuI6JxhoAaChNV/TcrkHRpCJvwjKX0GHmiVJbZ
	 zlbDGWLFJNDZMCoUEfHLNImah9In2t4Z9ebytf923957Fltf+YPEiZhxNHXneUra/b7HO
	 faYoWT/ztsq4EdiEvRE8PyPGtJnn34tmkEnms2oBlMSc7SRF0M5Ja2AvPClvYzbeyuD4h
	 0YYKjhm4jfh8i4BAPnybTZYR8C9/mCSd8ZO2BLl/t+aS0xWtIjdQ3z1UINelbKJ8Ws8U+
	 4aiTLs51sz2CldekJeoxbNKsAwwDjvDo8C7YQf8e/Tq/z2WpOKnPCCD8UR2hBt3FD5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wIzTE7tJ;
	arc=none smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F38D606A321
	for <linux-mips@vger.kernel.org>; Mon,  9 Nov 2026 17:43:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F38D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wIzTE7tJ
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93e4c00d71aso103764785a.3
        for <linux-mips@vger.kernel.org>; Mon, 09 Nov 2026 09:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246236; x=1794851036; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ODDsFkmR4JZZjzffhsKtiZTywC4t5hT17cOUsHgNWAg=;
        b=wIzTE7tJZL57n4rOmfvRje35MjUF+8WHf5ImqsavMNtYxjHYS+ACiQLBGeyWpSLHYY
         yRrfeIoJSuqRPB/6chSwuuDdc+NH8qaP+8NVpmo6JVUvqraKE5z/C4z9vgm2jL8G7RDL
         kFnAeycHLSHPt0ozm3QTOcrpY9HGw7sXdh85ZGsbfmQn1mTlQ+aJpzPqA/WbjHzYT3cZ
         yDk0vIBNuWp9ZGrioji495WD7xPUNwlIUH4uzWp5MI2OwouJ9jDmZgcRQYwrAFTCezIk
         U3d7Ft0gjlvjkPXvNUsaPZv20DA3c7+Rv0T0XHIHnj7s9wbIWhlsRS9Aj/WzJ5TovGU9
         IuFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246236; x=1794851036;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ODDsFkmR4JZZjzffhsKtiZTywC4t5hT17cOUsHgNWAg=;
        b=EyyiybWeuozAwCDmzbBtDf1VuRQKKV7HnvQ6jy26jL+f3vdKZ0HoZA4lqL3uG9Umho
         +yPgBT75pxW44qxIQ7iwg7OX8kAY3saBVv/rf8970M4qBbhDLykLt7PpgqekMuRQO+X2
         q2JwxKitsFrbg1dMntLOibxZP+HEZy/PzYaXV6tEAuOrgD7MZ0xUzcsptpMa3xpk1nrd
         AhJDU7/MSNkW/xn1LiAVZJJpvyhUi+bwDQ0/bWFp3l/RRMgUBMEeD6C+DNGwDlY1+FkK
         oGmUmzJw+liliF/mzTsldNHWFUFhKdXZrlChrzHFINr5MGTYM4EvS/Pl3chmluIIG508
         HRHQ==
X-Gm-Message-State: APuU4Z8V0hpKLyGNkVmx5kdYidT4tTsjLHL3xB951cXVUjnFmSGYBLBZ
	sK2VlPTXiwtjaf7g4oJpylcHvduCw5sO84+nK/RmE18e5RzT9H6hP/izsE/duQ==
X-Gm-Gg: AYBFou0+CWfmggKO67zq8T1Dz0E7bt+Pj2mENdXmuOlFDRBWKmdTKvNzHOQAD5deKHQ
	f6tPNqGk6FUmVkjaYdIdxujMeMNcV9qgIBRH1Zxu5LDz6OREsXsOgeCvNbVNObAmtKFP6D4kLQ7
	yaIUDwF+JondMmXulIeD1bVLBz3OqYoPmdLHwR1u9I+rS1ZvJ876iq2E6G8x64SnIxYi7ABW7Fd
	fZLFWAfOtcvWOhCUm3AQODQ7HVwPBzu3eQ86myhLfcVkZjvWxkc4Tc6O3oHvs+ZghB8J7AuubDx
	0A1DfjXHZiRYKTi32ozNVHnVubxStQYjBNFiZXwP+lBy9QTij1wlylvi/EPClgceYD5GqgoDh40
	8yyIZ69HKyxNgpCYqA1N5opLUpPsH8Izr8+P9WxyYjYQWfTNUR5OhBRvnClpomWTIY+5nioIKLG
	v22gyUKmdDRysou8Dbuy7c64N+jU/+wsf0HbIrxWXtsxgLptuXWwrKl+RBNAvumiYpplw0EhKN3
	MQk2lxlNHY+QoklFcjnC55jN77ViPDB5dYitoO06u61OMVX6ckhk4cCFSGLxbsDOcVlibmwPcVA
	EbvRsbxEbPvQW633nQNuVtLpjJU4tmoklWE1R+gqaYZ9dVd6iQZ/qbo=
X-Received: by 2002:a05:620a:199e:b0:939:a003:7127 with SMTP id af79cd13be357-9479f2e5f2bmr27118285a.52.1794246235960;
        Mon, 09 Nov 2026 09:43:55 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e784b90sm24886985a.22.2026.11.09.09.43.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 09:43:54 -0800 (PST)
Message-ID: <de0d1eb4-b866-43a0-980a-ec017d93549f@gmail.com>
Date: Mon, 9 Nov 2026 09:43:53 -0800
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MIPS: SB1250: Validate and update IRQ affinity
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20261103215043.1190947-1-f.fainelli@gmail.com>
 <alpine.DEB.2.21.2611060517330.17804@angie.orcam.me.uk>
 <alpine.DEB.2.21.2611090615360.17804@angie.orcam.me.uk>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <alpine.DEB.2.21.2611090615360.17804@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Maciej,

On 11/8/26 22:17, Maciej W. Rozycki wrote:
> On Fri, 6 Nov 2026, Maciej W. Rozycki wrote:
> 
>>> sb1250_set_affinity() selects the first online CPU in the requested
>>> affinity mask without checking whether such a CPU exists. If the
>>> intersection is empty, the resulting CPU index is invalid and must
>>> not be passed to cpu_logical_map().
>>>
>>> Reject affinity masks containing no online CPU with -EINVAL before
>>> accessing the CPU mapping or interrupt mapper registers.
>>
>>   Why do you think this is needed?  The only case where an unvalidated mask
>> is passed is AFAICT with:
>>
>> /**
>>   * irq_force_affinity - Force the irq affinity of a given irq
>>   * @irq:	Interrupt to set affinity
>>   * @cpumask:	cpumask
>>   *
>>   * Same as irq_set_affinity, but without checking the mask against
>>   * online cpus.
>>   *
>>   * Solely for low level cpu hotplug code, where we need to make per
>>   * cpu interrupts affine before the cpu becomes online.
>>   */
>>
>> -- which does not apply here (nor for arch/mips/sibyte/bcm1480/irq.c,
>> which uses analogous code and should otherwise be updated accordingly)
>> since all the CPUs are onchip the SoC.
>>
>>   Have I missed anything?
>>
>>> Also update the effective affinity mask to reflect the single logical
>>> CPU selected as the interrupt target.
>>
>>   Likewise, why is it needed?  This code returns IRQ_SET_MASK_OK (should
>> really use the enumeration constant), so the caller will do the copy.
> 
>   I can see it went to Linus already.  Can we please have it reverted?

Apologies for the late response, I was hoping Thomas would allow us to 
discuss this before applying. The effective-affinity update addresses 
this warning observed during boot:

genirq: irq_chip SB1250-IMR did not update eff. affinity mask of irq 2

IRQ_SET_MASK_OK causes irq_do_set_affinity() to copy the requested mask 
into irq_common_data.affinity, but it does not populate the separate 
effective_affinity mask when CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK is 
enabled. irq_validate_effective_affinity() then finds that mask empty 
and emits the warning.

Since the mapper selects a single CPU, 
irq_data_update_effective_affinity(d, cpumask_of(i)) records the actual 
target and addresses that warning. I should have included this in the 
commit message.

You are right about the empty-mask check, I will remove that part, 
revise the commit message accordingly, and use IRQ_SET_MASK_OK 
explicitly. BCM1480 should receive the analogous effective-affinity 
update as well.
-- 
Florian
