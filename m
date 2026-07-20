Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3200925CC74;
	Mon, 20 Jul 2026 09:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784539174; cv=none; b=ruJFqF1CxmWkB2BN7YWW2CiRk0HZEaC3e3CQ5dmfN+8T1EUoEPZPhOeLpy1nNKRE46l7/sEcmCWeV/77wzaHqMVLf+jcR4Kudc7XIYeDyzCi5ME8BmSMpW7ZWgXtHAgwCuDQrefZ6HxdSoBdP89v9AFGgS5wwfm2PHukxsmiSc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784539174; c=relaxed/simple;
	bh=0rLHL3wJ80kewNurXP7WWzHcrc8Mtn4zjdpAPpL4vYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mT0bAmCyHftmgpd9gB0fChGhW2K7sIPKlR0DTcaBt+2PvtiESs6m+Sn3KPAi3kXJGYGE/uy1xkvizjMoTD8ZR4021FYotjnPUwwSvo6T/YBHIzd8vTTth8LK0DeSPe2v+M1WavpgCcR7AtExweHOKlvMXuBM9xI+YQly3uliO8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T0kNNdIe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T0kNNdIe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB07B1F000E9;
	Mon, 20 Jul 2026 09:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784539172;
	bh=2xlv9UPOXY4FPesU3+Oc7TRyQqsHVLIjZMiUOIzWc+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T0kNNdIe5uGMUq6ImNPNOQIsbEwTt2oae4ZHmIIZsJNHA9zzjf/D3tiOvsQs4FS1U
	 dr8gbtzrmsZHH+Qw2n6AZKtwIVTfT/y18RazaKAWBXjta9rqW9kikc+fWUwVxgs9Rr
	 x9HKzDUvYQrT3l+ciGl0Um/+ohKJx/ZgMuVJUl2aIDo58vf2MTMbcG2fJDKVBF/rTv
	 HnlaPEGUBpZsV+sphEh0+ED35bXTfQctS3i9SuHoDoIkpdadyxwTcdjyiWRrnQDAlh
	 BcBfwOvkxU1R1IioHND8Kt8dmOOoExrJ0p/MTnuNfg5ZxCtYb4Qh/BmSBCECoxL6TT
	 MyHIRJohyG+hg==
Date: Mon, 20 Jul 2026 10:19:27 +0100
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
Message-ID: <20260720091927.GA1736709@horms.kernel.org>
References: <20260622211430.4008899-1-pnina.feder@mobileye.com>
 <akybBoCAm-kJbfHL@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akybBoCAm-kJbfHL@kernel.org>

On Tue, Jul 07, 2026 at 09:21:58AM +0300, Mike Rapoport wrote:
> (adding new Baoquan's email)
> 
> Hi Pnina,
> On Tue, Jun 23, 2026 at 12:14:26AM +0300, Pnina Feder wrote:
> > This series extends vmcoreinfo with struct offsets and sizes needed by
> > the vmcore-tasks userspace tool to extract per-task state from a vmcore
> > dump without requiring kernel debug symbols (DWARF/BTF).
> > 
> > The vmcore-tasks tool reads /proc/vmcore (or a saved vmcore file) and
> > reconstructs, for each task:
> >   - task name, pid, state, flags
> >   - VMA list (start, end, flags, backing file)
> >   - user register state (saved on the kernel stack at kernel entry)
> >   - user-space backtrace with VMA/filename mapping
> >   - kernel dmesg buffer
> > 
> > This provides a lightweight post-mortem crash analysis capability for
> > production environments where full debug info (DWARF/BTF) is not
> > available.
> > 
> > The companion userspace tool is submitted to kexec-tools:
> >   https://lore.kernel.org/all/20260622205550.1087163-1-pnina.feder@mobileye.com/
> 
> Sorry for the delay, this fell between the cracks somehow.
> 
> The kernel side looks fine overall, but to merge it there should be an
> agreement from the userspace side maintainers that vmcore-tasks is
> something they are wishing to accept.

Hi Mike, all,

Sorry for the extended delay.

I will send some minor feedback to the user-space tool patchset
but overall, yes, this is something I would be happy to accept.

I don't want to create a chicken-and-egg type problem here.
But it's probably worth mentioning that usually features
hit the kernel before the corresponding code is accepted
into kexec-tools.

Let me know how you would like to proceed.
