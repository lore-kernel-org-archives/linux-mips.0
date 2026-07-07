Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BB13E172C;
	Tue,  7 Jul 2026 10:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783420042; cv=none; b=LBOHbzgqhK4Z2xEz/qbOXZoS0aHp7Svouahf1SPs7DuhFrqRyguo5xQlelmJY7Yn8cMw+XVxBbZIE8L68Ekekb4fcI1vcdeNDihR1mZwjid0cgkM8Wwof+lokepW20Vg7Cehu/YgmiBENPQJ8Ayf71oGmYA1jvxxHTSbah1MweA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783420042; c=relaxed/simple;
	bh=hwkciJaYcxIzG6ZEHEs/RLFQvJeCJtd3tjyqXwMhryQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hob786wek74vrZbBWMzyQ9qVI/dfKNW2gRwwbggbrf1ZHgC9++TvvVd8cm/rpXIQYJQLzbfcc+XveDLdFf0FyVokgMKqgQ5zTOy2iFfLNfSfpT/bB8lBaJPb3DebC0ZlWdq0T5D+GUfDxx34BnqgKP+KASKTLOc+hdKfisd3O8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AYQQX6xq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AYQQX6xq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D840A1F000E9;
	Tue,  7 Jul 2026 10:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783420039;
	bh=HCUXZj1UudD81J+tzs1iNoS5NARfatylA2v+XY7w0pU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AYQQX6xqoBaQvhhm8WxPal1Czc3Nsm4qzpqq/veoFkttYnv5OubhCsCtzvx423TO2
	 OQH5I8dpRYNxo9+D1JwUr2qRQYFgz8TStY2wEQGfOZO11H9EqiN++b4RLIAOVNbZ1/
	 m8nD2iN7DDdB05+HW4wYHIzROTXwent0P+GN7QcChPsD32M4gUsN1E+pd3e3Hy+xPD
	 LgqLKveiNXmQ5n4QJgelDe2B6/sGChVFieuwNQ0LWAV434leNc1326gHSSV4JhBquk
	 ClDEAHmHs0GF5jx5XboyDmKuP9Ekbboe18xcXYhdgGlg1TueweSgdIDp5xFwTZFlQV
	 QeDxw/JZa7j/A==
Date: Tue, 7 Jul 2026 11:27:07 +0100
From: Will Deacon <will@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, tsbogend@alpha.franken.de, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	hpa@zytor.com, peterz@infradead.org, kees@kernel.org,
	nathan@kernel.org, linusw@kernel.org, ojeda@kernel.org,
	david.kaplan@amd.com, lukas.bulwahn@redhat.com,
	ryan.roberts@arm.com, maz@kernel.org, timothy.hayes@arm.com,
	lpieralisi@kernel.org, thuth@redhat.com, menglong8.dong@gmail.com,
	oupton@kernel.org, yeoreum.yun@arm.com, miko.lenczewski@arm.com,
	broonie@kernel.org, kevin.brodsky@arm.com, james.clark@linaro.org,
	yangyicong@hisilicon.com, tabba@google.com, osandov@fb.com,
	arnd@arndb.de, anshuman.khandual@arm.com, david@kernel.org,
	akpm@linux-foundation.org, ljs@kernel.org, dev.jain@arm.com,
	yang@os.amperecomputing.com, chaitanyas.prakash@arm.com,
	kprateek.nayak@amd.com, chenl311@chinatelecom.cn,
	sshegde@linux.ibm.com, thorsten.blum@linux.dev,
	chang.seok.bae@intel.com, tim.c.chen@linux.intel.com,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 05/12] arm64: smp: Defer RCU registration during
 secondary CPU bringup
Message-ID: <akzUe3aIKZiEr4at@willie-the-truck>
References: <20260624092537.2916971-1-ruanjinjie@huawei.com>
 <20260624092537.2916971-6-ruanjinjie@huawei.com>
 <akvoVCNFwDorQg6y@willie-the-truck>
 <58a9fd8b-387c-41c6-91a2-48ec885870d5@huawei.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58a9fd8b-387c-41c6-91a2-48ec885870d5@huawei.com>

Jinjie,

On Tue, Jul 07, 2026 at 11:02:32AM +0800, Jinjie Ruan wrote:
> On 7/7/2026 1:39 AM, Will Deacon wrote:
> > ce3d31ad3cac ("arm64/smp: Move rcu_cpu_starting() earlier") was to
> > handle the useless print in cpuinfo_detect_icache_policy(), but I've
> > decided just to remove that one. So I think the remaining prints we have
> > to worry about in this early boot code are from error paths in the
> > CPU feature detection logic (check_local_cpu_capabilities()).
> > 
> > Given that those error paths should all be fatal, perhaps we could
> > rework cpu_die_early() and cpu_panic_kernel() as macros that take a
> > string argument and either call printk_deferred() (similarly to what you
> > suggested in a previous version of your series [1]) or do the
> > lockdep_off() there before a pr_crit().
> > 
> > What do you think?
> 
> That is an excellent point. Reworking cpu_die_early() and
> cpu_panic_kernel() to uniformly use printk_deferred() based on the
> specific error type or the string argument is a much cleaner approach.
> 
> This makes perfect sense because these paths are inherently fatal, and
> switching to deferred printing avoids the risky lock-taking and RCU
> runtime constraints during early boot entirely. It cleanly resolves the
> diagnostic noise without broadly blinding lockdep or hiding potential
> locking issues down the line.
> 
> I fully agree with this approach.

It's great that your AI chatbot thinks this is fantastic, but what do
_you_ think? I'm much more interested in your opinion, as you have
already spent time thinking about this.

Will
