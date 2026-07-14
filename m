Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1420546AEEF
	for <linux-mips@vger.kernel.org>; Tue, 14 Jul 2026 12:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784032470; cv=none; b=G6/JCjR9klGILFVqUrbzdOJpogn+yMNTYWA/5s+apfASXyTvYBFWwpcS4B4AEPKk+D+LlEDv3EMzutYqjP0TC/BQ2KYpdFd+z6VO42exVMzG4LN1rW3fy9ZNm6bchgOr2+HWcmOCCsW8XF/hJUL4/Vb9zm2FyNQ91fBNCeMrqNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784032470; c=relaxed/simple;
	bh=WegHpjcb2vagWqLjN3VnSMlDf7mDmA8mmd3Rp43fqxk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VQRCNn4a/w4bVkhrM7cK5J5uJACFe+/a+nOFLlJeQawtl+ynUd4s9TBZlt/oBCo+uyIB0EMMmKNo2sJ4K94YdfCdUJqrZsObjPmc8BQKMOD/Ly0zE/6rD9V4jgOihJKjwKtnI0hzRaFiBllKbZT1J6tnFsrZSoXzEbB6EJVkONc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lYjlWK1u; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lYjlWK1u"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47d6c634f45so2338083f8f.3
        for <linux-mips@vger.kernel.org>; Tue, 14 Jul 2026 05:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784032459; x=1784637259; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CcC3mXhC9vFPxE1TVGprdVmvuMWQZA/m1vfAGdGaT0s=;
        b=lYjlWK1u9qTN9m59IOgLZFFl6A3QUAJm3hdoEWMcd5UKeeBoShkzCviu2smy4APX3v
         NN5AZkPK1ppnlJXxGIYtb3uSBTUAc0B+wayHesZpCBe4jytJPUY+BljPijmMgpcegPIF
         PXKSWEOW3ErIiWzcHUW6W3XWuMiWkNtznHfjgl+Ze5WjS7p75CkTtBEUjZ7eYYEb4WVe
         t/wLiAqhA+bcnEt3jwXlx9rr7iFDZTXx8m0oTcDew40YJPRuD5W9kS9Gacv+xSLvl4Q5
         oTVGJsu9IQsI31fiS/t7+SgCqd9JTLWr2IMEoMEi7hVerkpv7kPlwAdXOuOq2N56iugM
         Hrfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784032459; x=1784637259;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CcC3mXhC9vFPxE1TVGprdVmvuMWQZA/m1vfAGdGaT0s=;
        b=mDZ3idPIhCNTuAIfDh41DgSfnzNSFNyDW/Sh1Gsa/eKsBNI9T7b7FF/akCgd7uSD+4
         cbhdNwndeEzn3rTGqY8RkY+w+OsDDLXhKjXijqdLzYpt4PwwjURw2iEP1M0BA0kWfbHa
         V7V8NZRxJ2t+fQ79CI2iopS6UvALE0N5N+d2TeS3vpnGvJ4UUw/MBYjv3g6kxB7Z0K5c
         MCnGgNw/vTcnGMYJvoQKbgAWDXb7Pwh+5y4/VdryA3cbLV/2D3PuouCAJS7NQYLd3oSq
         tmsgNXgy0RQZWEjrQBBRkw+cLIq7vBtTlxXsCIS89oxf0QI6MKDh27iAgjV/SgvQty80
         xHWQ==
X-Forwarded-Encrypted: i=1; AHgh+RrobD6gKYHOA+G6m654cS6YASZ4jfw6NUF84oWzeoicikGDgK81jmyX/EosKu/0GNGnzrPP3WcHu9K9@vger.kernel.org
X-Gm-Message-State: AOJu0YyFExjDydHYh55vH46THyCMse9K2qclMtmB66HVspCnt6rs19YT
	VIh0FKokFTSEppkYAw6Z6p/ubHOuExpViSc9cwkihHIKCTDzPLQYCuMf
X-Gm-Gg: AfdE7cl9zUUDNkmePxH0fmfC8EY14gUmk7xcXUmbJSfTmPZ5aGxaKrjLgcAEBBweZDl
	k41/idJt2M353tJwM35VTDocEFB3TUK0LZeLhXt3Xmdf/AUnZgeC1GXMjJ02WBkmeAWYoFJSlil
	H0ZHti4d3BNjUftZsu7KWQpqbpZXMabXakHgvNc4jBcISXtjfGVYemVz8LOSQ0AHWn85IrAt49n
	hMwcGn27srFlth5DRW/0yeDqlsvyY+aw8AUoN+Io6D7IQ5Z88mnEgWBH5vL/xbNY18eVvYOFroZ
	r3wB5tYWDtGtIFG1ufcL+zsg0+p6Xs4f7xeYfgNQx8Y2WhQSgm/XLdOwt1+t21WjOoc0HK27Q/y
	41aVPpDw/j0tVNNqeLDSkQC/Ob+ghIjEpS4Lx7ZQP3HvWw8Clw9Ig9i8KzStp12BGT321l138zd
	UdPocYrSZOlZaVfJy7hh+zykVf7iwsLy7CJl9Y2jKCuvzVORUcAfuL55mm8awl
X-Received: by 2002:a05:6000:4903:b0:47e:9d58:3b4e with SMTP id ffacd0b85a97d-47f4887f947mr2511343f8f.24.1784032458400;
        Tue, 14 Jul 2026 05:34:18 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c1f84sm8103524f8f.29.2026.07.14.05.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:34:18 -0700 (PDT)
Date: Tue, 14 Jul 2026 13:34:15 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-arch@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, x86@kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com, linux-csky@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org,
 david@kernel.org, linux@armlinux.org.uk, akpm@linux-foundation.org,
 ankur.a.arora@oracle.com, rppt@kernel.org, linmag7@gmail.com,
 chleroy@kernel.org, klarasmodin@gmail.com, chenhuacai@kernel.org,
 kernel@xen0n.name, kas@kernel.org, zhangtianyang@loongson.cn,
 wangyuli@aosc.io, tsbogend@alpha.franken.de, ljs@kernel.org, jgg@ziepe.ca,
 catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
 ryan.roberts@arm.com, pasha.tatashin@soleen.com, rmclure@linux.ibm.com,
 baolin.wang@linux.alibaba.com, tj@kernel.org, kevin.brodsky@arm.com,
 anup@brainfault.org, atish.patra@linux.dev, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 tglx@kernel.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
 hannes@cmpxchg.org, mhocko@kernel.org, qi.zheng@linux.dev,
 shakeel.butt@linux.dev, kasong@tencent.com, baohua@kernel.org,
 axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com,
 ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, vincenzo.frascino@arm.com, anshuman.khandual@arm.com,
 yang@os.amperecomputing.com, chaitanyas.prakash@arm.com, ardb@kernel.org,
 guoren@kernel.org, yang.li85200@gmail.com, viro@zeniv.linux.org.uk,
 dinguyen@kernel.org, schuster.simon@siemens-energy.com,
 wangruikang@iscas.ac.cn, junhui.liu@pigmoral.tech, muchun.song@linux.dev,
 vishal.moola@gmail.com, namcao@linutronix.de, pavel@kernel.org,
 djbw@kernel.org, yu-cheng.yu@intel.com, baolu.lu@linux.intel.com,
 Jonathan.Cameron@huawei.com, coxu@redhat.com, andreas@gaisler.com,
 liam@infradead.org, vbabka@kernel.org, surenb@google.com, mhocko@suse.com,
 geert@linux-m68k.org, shorne@gmail.com, jonas@southpole.se,
 stefan.kristiansson@saunalahti.fi
Subject: Re: [RFC PATCH 02/34] ARM: mm: make 2-level pgd_t a scalar
Message-ID: <20260714133415.78e25654@pumpkin>
In-Reply-To: <20260713135614.1618183-3-yeoreum.yun@arm.com>
References: <20260713135614.1618183-1-yeoreum.yun@arm.com>
	<20260713135614.1618183-3-yeoreum.yun@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 13 Jul 2026 14:55:41 +0100
Yeoreum Yun <yeoreum.yun@arm.com> wrote:

> From: "David Hildenbrand (Arm)" <david@kernel.org>
> 
> We don't want pgd_t to be an array, as it prohibits returning it from a
> function, like pgdp_get().

If you use a two element structure the compiler/ABI might be able to
return that from a function in two registers.
That might make the entire mess more readable ...

	David
