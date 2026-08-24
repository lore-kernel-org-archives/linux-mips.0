Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7AD44CF22
	for <linux-mips@vger.kernel.org>; Mon, 24 Aug 2026 15:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787586315; cv=none; b=BeVVt0tfeF4zsDRQF/1tHHw43SrkY5DnqAU6SIdoN7m32uV+8dJhmpmj8Uql18le3X8KHRIlffo1z6gMzumrZshQqY0Gcxh6dIeM6HR8QGxoSzZwNM1PzZnChHaQPe2wXDD8QzyUc1XKGl0qs5SYvfoYRrs5fP8IJsnrO1C/ItM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787586315; c=relaxed/simple;
	bh=rH5ooTmhOET3vAsIUkA6yaGvEUpGPYpVuc1a+dr0RM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GKC3WfRv2rO5TLozaaTPTVtjlUumBSM9cY9QxV8XxlXEDQNKCAYbXRHwiNJEt3TmYi6kfnHKOi2iklHxyZ/wSiNdd0lmWiVy0WF2demFPIMcEwUXxUysmWbLB7e/2t160BiZZ/3PLQF5eCkBWwr5iAfDbuHaxNL7euiQVXh+ibY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=XiWO3OjI; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="XiWO3OjI"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e347638adso3358523a91.0
        for <linux-mips@vger.kernel.org>; Mon, 24 Aug 2026 08:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1787586312; x=1788191112; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QEtJVtkW7q375yAi3A0GskrIJ2s9H0yJ3yupt0Y509Y=;
        b=XiWO3OjIqdcETuZVZGtwjGh/ridNShPFkWNE3WtqLgW/OCUrW4ceSniPCnuw3SK9w1
         XTU8Ys9ZLukdPh1w7VDEanB/FM0sqiWMGyN4dR5evFWNqo6ePuO07HrlNh2fuCx4GNru
         vGoj5lnIz6IFL6b637DRdsu/jePBVR3paCUUy1VRsZi5Dp/5l5BDabEV2rm4s/++FuVi
         7cSrGkjkmZ9dSZmXjXXxqZfPXtq1iTfhvn/lNVGmVmKesYI+fa9ppS+0qqeikflC0VM+
         JFIvYdhKOwdGtQFELrlmbm4uwP6XS2FYISN62wP3zDXL1mZB+3qq3TjDJETwgSTW2eHm
         A9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787586312; x=1788191112;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QEtJVtkW7q375yAi3A0GskrIJ2s9H0yJ3yupt0Y509Y=;
        b=hCEzSd+8+3zB7xk0A5ogLu3CHxKr7uFHBc7NQNRufN4NwV2+riBD0njCwe9sWI/jp1
         VG7V9eYabCALSAnpHx4DKMLIeUrZ75HGRJdaWFOr+tsVVQ9kh5UBRnjpPxNup+FHW/nB
         c7V595mA8drV2/JrP7lW1kuE12nl7ajTzUZ3V251Bvv6EGWS2/KLK65o/XxNnpaYt7G0
         FZHKpeY4IG8re10DVjKFBv+wNBDrT+VvEX7RP9TLBHegMwyW18Bux5ZDGQ8AVFBuTeql
         4qU/M0tUhOTU9wCllPCUjbWlALG8husA2Ih3RLTTf2QkWfYg+0sLcMVZG4zbRkZC+9cf
         /37g==
X-Forwarded-Encrypted: i=1; AHgh+RqFOjp+ryZJ+ldjHMSIHrnBvg59C31DP+tw9ZKKemGLcMVYvVRdziJP888APT1CyGJdRMqQCtAZupZ8@vger.kernel.org
X-Gm-Message-State: AFuF++mWPoEni7u4Q8vvFPz9GH7stfwwgNyTxKwI1fIhaY7LYiWhyKG2
	3JbzYXKNSqgOxUJpDM27TjbPrG1ce5cG9SV9uLkqw7JTAle0+viNWRMR/hU+pK+7lC4=
X-Gm-Gg: AR+sD10RpXMqAL1fE5WtgIOi9vpSBU+ukBhbq7UzsGJHJOcb/h6gi/og6Ow1L0nkFB7
	mmtO5K52A2X9oQ9ZRoh/+cYH74xJoAr6yxloL2AcNnZ5LjxGOMV3/hzr694Gs5aTiiekDNTvWrn
	mNplcpu5Wfen83147WurfbAHjbPPEJYAJKQF3L4yC4vY3Rsg0HjOlok/CIm+7gkM+uxyKsXEiJm
	XBm+sijLksjVRo/7ZpnCtZKRJ4tw7+ljGM/KrbVKuR9XQR3yYUTItmxO2DPRmNS5lP2EXAKc5FS
	XRP4ILUdujB6A/HfNKZKpKYOF162EXab3avtV/i4qCIHtUdMUin7N4lUI+saBWz3cwLafLDC9Pi
	KyIMbZejFtbP7QRM2NoYryuNQLKBPR39RPmaMSNBNATjON8o0e7M5n1l3XAwA3pHQbc/ksKnTgB
	T2DQtWbE58fYSglD8MdQaSSvyATBlQfLRVGvYP2g/WecySNrq7oxKxfkb5ItavkZjJC/rCdq8Ot
	fqBSnl3sQv/RmQ=
X-Received: by 2002:a17:90b:5867:b0:395:4de4:92c8 with SMTP id 98e67ed59e1d1-395df4dcdbcmr39252435a91.15.1787586312489;
        Mon, 24 Aug 2026 08:45:12 -0700 (PDT)
Received: from [100.64.0.1] ([165.225.242.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645b7ff6dsm23611a91.10.2026.08.24.08.45.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 08:45:11 -0700 (PDT)
Message-ID: <029cfde8-74fc-4437-bc18-b1b53d44cab2@sifive.com>
Date: Mon, 24 Aug 2026 10:45:09 -0500
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V3 1/8] mm: Make ptrval_to_str() generally available
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker
 <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lorenzo Stoakes <ljs@kernel.org>,
 linux-mm@kvack.org, akpm@linux-foundation.org, david@kernel.org
References: <20260818040041.1891769-1-anshuman.khandual@arm.com>
 <20260818040041.1891769-2-anshuman.khandual@arm.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20260818040041.1891769-2-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026-08-17 11:00 PM, Anshuman Khandual wrote:
> Move ptrval_to_str() inside a header thus making the helper more generally

Typo here and in subject: ptrval -> ptval

> available for new users which are being added later. While here, also move
> another related string size macro PTVAL_STR_MAX inside the header as well.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Lorenzo Stoakes <ljs@kernel.org>
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  include/linux/mm_types.h | 15 +++++++++++++++
>  mm/memory.c              | 16 ++--------------
>  2 files changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index b18c2b2e7d2c..a5b514e55dd7 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -2001,4 +2001,19 @@ static inline unsigned long mmf_init_legacy_flags(unsigned long flags)
>  	return flags & MMF_INIT_LEGACY_MASK;
>  }
>  
> +void ptval_bytes_to_hex_str(char *buf, size_t buf_size, const void *entry, size_t entry_size);
> +
> +#define ptval_to_str(buf, val)								\
>...
