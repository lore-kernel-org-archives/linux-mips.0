Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1263DDDDE;
	Mon, 20 Jul 2026 12:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784551400; cv=none; b=OsfogYLaK1sQI4AsJ9t1v03gTpox2IH4vnMl8CgFOV9rHIDX86+Hk0Vz3+MASCJyLQjtuSWHm5Rh0KyhpyTeHg3kuH8/5NwiYQrJYA3naKlsSJaaGD3+VCG1EzUQ2cUUbJKylsZ1ALyJFSdYidJ+KonxilNmeQp9WZaCspN/w1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784551400; c=relaxed/simple;
	bh=msHVGP1E22oRI+Zeo8a4OMj66O6qtdkoclmb7FSeb9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b4s8kYawb74mvBOJXj0CsmeluA1X5HXUsQzX3nzKGENfcNv/qFJ9LcKOOMOHM3ixKryDlLU80jqGw1ogbfjqGwnTtdmD09X4vUTpuUDYn7pOBZ9kaFYLvaEY+Rlg6mfBtj533eSD4LqBB4QFFpwMtPTYQWNK57cYNGWeJruptxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C2KGFoH7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C2KGFoH7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C02101F000E9;
	Mon, 20 Jul 2026 12:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784551399;
	bh=/iig1PBFdcY5HjlDuDU/ADsRJNO/Hx2Bt7lB9eeE+YM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C2KGFoH7pJ83K2lvgvwaBViS832LyhVDhzK+gYrDm//Wacyhb8iZjL6FL/5KoOAMm
	 gykvbdJUUb8za46mKM+vvkIg75ktBdDRFMkeQ60bebVECAM8LDq551QWsi39nubm3M
	 f0bijeVlQZ1l1URXOCz12bRAfczsKWTk2v4FkqSsevjPw5CK0fF9tLUvxrlQtJLm9e
	 CQm61a93+a14hp896s1BJ5I03BijR+dPV0Y++8FEUmKQwsku4NPfG9tYKkPhoZCxzE
	 sxkqhBBJeq0tGuVKZ09aiBZId7G9P9Tll+X4kkYj9Q06IJ98xwWPngvKWL8xQV0gAD
	 ACWxcsOpSTR6w==
Date: Mon, 20 Jul 2026 15:43:11 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Simon Horman <horms@kernel.org>
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
Message-ID: <al4X300UObXawEIJ@kernel.org>
References: <20260622211430.4008899-1-pnina.feder@mobileye.com>
 <akybBoCAm-kJbfHL@kernel.org>
 <20260720091927.GA1736709@horms.kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720091927.GA1736709@horms.kernel.org>

Hi Simon,

On Mon, Jul 20, 2026 at 10:19:27AM +0100, Simon Horman wrote:
> On Tue, Jul 07, 2026 at 09:21:58AM +0300, Mike Rapoport wrote:
> > On Tue, Jun 23, 2026 at 12:14:26AM +0300, Pnina Feder wrote:
> > > This series extends vmcoreinfo with struct offsets and sizes needed by
> > > the vmcore-tasks userspace tool to extract per-task state from a vmcore
> > > dump without requiring kernel debug symbols (DWARF/BTF).
> > > 
> > > The vmcore-tasks tool reads /proc/vmcore (or a saved vmcore file) and
> > > reconstructs, for each task:
> > >   - task name, pid, state, flags
> > >   - VMA list (start, end, flags, backing file)
> > >   - user register state (saved on the kernel stack at kernel entry)
> > >   - user-space backtrace with VMA/filename mapping
> > >   - kernel dmesg buffer
> > > 
> > > This provides a lightweight post-mortem crash analysis capability for
> > > production environments where full debug info (DWARF/BTF) is not
> > > available.
> > > 
> > > The companion userspace tool is submitted to kexec-tools:
> > >   https://lore.kernel.org/all/20260622205550.1087163-1-pnina.feder@mobileye.com/
> > 
> > Sorry for the delay, this fell between the cracks somehow.
> > 
> > The kernel side looks fine overall, but to merge it there should be an
> > agreement from the userspace side maintainers that vmcore-tasks is
> > something they are wishing to accept.
> 
> Hi Mike, all,
> 
> Sorry for the extended delay.
> 
> I will send some minor feedback to the user-space tool patchset
> but overall, yes, this is something I would be happy to accept.
> 
> I don't want to create a chicken-and-egg type problem here.
> But it's probably worth mentioning that usually features
> hit the kernel before the corresponding code is accepted
> into kexec-tools.

Sorry if I wasn't clear. 

I didn't mean that the feature should be merged into kexec-tools before
merging the kernel bits. I just wanted to make sure there's no fundamental
issue from kexec-tools perspective.

> Let me know how you would like to proceed.

I'm going to wait for Baoquan's review and once that's done I'll pick up
the kernel bits.

-- 
Sincerely yours,
Mike.
