Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA42836A34E;
	Tue, 21 Jul 2026 11:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784632416; cv=none; b=hjmb08nlhVgewob1/ze9QCU5tPStV0coHK9yu5sPkZExcR4/Hv535GpXkHzJeW7RodDveLdCtDl8UsrLB8jmd5sr2pZBnTcvXAIvhrHkaEbiOXgv/9xrIITv61shTkX2MUNmV6l8HGS2coGlbfhrv6o9UOuVuRIuZ6Ga4mYIo1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784632416; c=relaxed/simple;
	bh=hVMFgW7GFpsFn+27vHqJFVJodoLBHMreceKvyVqTWgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hyLiknYUpy/kEw5EydU+5QS6oAFiTDuxon5kIthFk9/gj6FhkFcJ2zzASZ4M/RIRJ0RT2vVTOiFR/7aC9c4/jwPxlo5JkG+5KOZSTW0ryM3aTcPnL77BCKMETEeM3DvOpVvy2J3Bk82txImcvQKuF20G2m/wlZLYa83eCUcsf6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HhpYzzM/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HhpYzzM/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 954BC1F000E9;
	Tue, 21 Jul 2026 11:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784632415;
	bh=OJ9YfaBFSXj+Hk6UH0eG4jUTBf/umVD52Blq68hhcTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HhpYzzM/oimKKYM+22iuflbObTtTZTtdDQiTiyxYtxAy56bVm2RUMe/378V24lMCy
	 N9e8S8m+u3CgY8ts4zAtzzn/7vOUZMXBdf24qhCZv9/TwkwwqyROndhV2evLOQdqu8
	 HBoTX5g3VolANyAmdxRBf+OKSdf8wzTD4gVePThB5rnLNMi21tyuQah/hjS+xzmi6O
	 +V6KY+DG0MFNy6G9jhnjGbGb6gjRw/JJMT1JAVLM8HYueumFcgncpSyOhJzG/H7zL+
	 pCiAXWPO74jZeBAiR5ITzdAOIhaTIq1nFewaleXIqgld/by6+2YLS8eesfYNZWbUK3
	 W+mvBX/jSsBVg==
Date: Tue, 21 Jul 2026 12:13:30 +0100
From: Simon Horman <horms@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pnina Feder <pnina.feder@mobileye.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <baoquan.he@linux.dev>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Dave Young <ruirui.yang@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, Alexandre Ghiti <alex@ghiti.fr>,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/4] vmcore-tasks: export per-task metadata to vmcoreinfo
Message-ID: <20260721111330.GA1768252@horms.kernel.org>
References: <20260622211430.4008899-1-pnina.feder@mobileye.com>
 <akybBoCAm-kJbfHL@kernel.org>
 <20260720091927.GA1736709@horms.kernel.org>
 <al4X300UObXawEIJ@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <al4X300UObXawEIJ@kernel.org>

On Mon, Jul 20, 2026 at 03:43:11PM +0300, Mike Rapoport wrote:
> Hi Simon,
> 
> On Mon, Jul 20, 2026 at 10:19:27AM +0100, Simon Horman wrote:
> > On Tue, Jul 07, 2026 at 09:21:58AM +0300, Mike Rapoport wrote:
> > > On Tue, Jun 23, 2026 at 12:14:26AM +0300, Pnina Feder wrote:
> > > > This series extends vmcoreinfo with struct offsets and sizes needed by
> > > > the vmcore-tasks userspace tool to extract per-task state from a vmcore
> > > > dump without requiring kernel debug symbols (DWARF/BTF).
> > > > 
> > > > The vmcore-tasks tool reads /proc/vmcore (or a saved vmcore file) and
> > > > reconstructs, for each task:
> > > >   - task name, pid, state, flags
> > > >   - VMA list (start, end, flags, backing file)
> > > >   - user register state (saved on the kernel stack at kernel entry)
> > > >   - user-space backtrace with VMA/filename mapping
> > > >   - kernel dmesg buffer
> > > > 
> > > > This provides a lightweight post-mortem crash analysis capability for
> > > > production environments where full debug info (DWARF/BTF) is not
> > > > available.
> > > > 
> > > > The companion userspace tool is submitted to kexec-tools:
> > > >   https://lore.kernel.org/all/20260622205550.1087163-1-pnina.feder@mobileye.com/
> > > 
> > > Sorry for the delay, this fell between the cracks somehow.
> > > 
> > > The kernel side looks fine overall, but to merge it there should be an
> > > agreement from the userspace side maintainers that vmcore-tasks is
> > > something they are wishing to accept.
> > 
> > Hi Mike, all,
> > 
> > Sorry for the extended delay.
> > 
> > I will send some minor feedback to the user-space tool patchset
> > but overall, yes, this is something I would be happy to accept.
> > 
> > I don't want to create a chicken-and-egg type problem here.
> > But it's probably worth mentioning that usually features
> > hit the kernel before the corresponding code is accepted
> > into kexec-tools.
> 
> Sorry if I wasn't clear. 
> 
> I didn't mean that the feature should be merged into kexec-tools before
> merging the kernel bits. I just wanted to make sure there's no fundamental
> issue from kexec-tools perspective.

Thanks, it is clear :)

> > Let me know how you would like to proceed.
> 
> I'm going to wait for Baoquan's review and once that's done I'll pick up
> the kernel bits.

I see that conversation is now active.

Thanks to all.
