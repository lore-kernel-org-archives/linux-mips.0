Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E69E47F3D5;
	Fri,  2 Oct 2026 10:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790937056; cv=none; b=cfb0dDrUQLhDEPylPNbrHmUhgaeWAVKHj+nrk7gz0utGYglbcOSNatFBYBHQGSmycKeehp3+jgvzDKgm9YOhTj9XtJoMuf6SffyHaOWeDPHFfx22CXUtTWtc5eNTcQuDl2/O1uLJ60AGw2QX5DVyvFq+dma2Se4IENLS0VwK3RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790937056; c=relaxed/simple;
	bh=pIGH0V5kadC2PW1/kTwCEjTJea3M+mAnHiCuYdJOJL8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=AG1MuJkP6jLop5vmwN4NyVwvzHfxtbbl5WcUQqT53Ek9oXhoH7enbTzTuc3AKG63LyxBne/Jn8RPn3cICrYfeneZXD94MLfKvaDb2BZCdRKi4fhi6JSklccYGTD3FLXih6JSWSbubxj0m3aXwn6hwyxRyl1FJ3flC+X6+0RwA2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FZ66Sp4o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FZ66Sp4o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EFA21F00893;
	Fri,  2 Oct 2026 10:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790937048;
	bh=yc1IIMGlaCGdOYuzLXeOZBI2ciPC6+7oDnRuG9aAllo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=FZ66Sp4o7Ynls3fytrnOjtk/CrgeHP9ASYQVydHFPboylqwYLdtqUery7iWpmi5K8
	 9dnhkPkoZrQiSZzbnXUJ3pTL5WwfhXXb+ZZepfdF+2tal5DtNpBDrlhsecPoTB1aJh
	 XLg+eVhtPbkIIV0ZipdVW+9nLkdbcOakEQ1lWTKYTE4VQb2lB1FBUkZf6r33JvqSmq
	 aLdAZ8wxys3xapvDETxAhe/9moexdSv49/X7kQgZqaaL7cmSMnskwd8Jitqgw6MWYL
	 RI6WRHijtD1Wrp3mIihow5l4Vr3rNOYfwgcKxJXtqnkY2CK0aclA2XPB8pSWnZ0+k0
	 1o4nB+ayPjVPg==
Date: Fri, 2 Oct 2026 12:29:43 +0200 (CEST)
From: Imre Kaloz <kaloz@kernel.org>
To: Lee Jones <lee@kernel.org>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
    mfd@lists.linux.dev
Subject: Re: [PATCH 31/38] mfd: ioc3: add IP34 system-board entry to
 ioc3_infos[]
In-Reply-To: <20261002100204.GB13860@google.com>
Message-ID: <6951329d-5ef5-b090-33e6-7af38e1d3893@kernel.org>
References: <cover.1790857966.git.kaloz@kernel.org> <e9b125b8ab2422717072f447c318eff41062bd79.1790857966.git.kaloz@kernel.org> <20261002100204.GB13860@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

Hi Lee,

On Fri, 2 Oct 2026, Lee Jones wrote:

> On Thu, 01 Oct 2026, Imre Kaloz wrote:
>
>> Register the Fuel system board's on-board IOC3 and its M48T35, whose
>> year register counts from 1968 as on other IP35-family machines.
>> Bridge-side detection was already merged in commit 2c4288719806 ("MIPS:
>> PCI: Add detection of IOC3 on IO7, IO8, IO9 and Fuel"), which matches
>> the board part number "030-1707-"; the cell table had no entry to go
>> with it. Without one the IOC3 falls to the CAD DUO default, which
>> instantiates no serial cell, so Fuel comes up with no ttyS0.
>
> I received 26 and 31.  Where is the rest of the set?
>
> I'd like to have full context please.
>

Sorry about that, my send used get_maintainer per patch, so you only
got the two mfd changes. The whole set with the cover letter is here:

https://lore.kernel.org/all/cover.1790857966.git.kaloz@kernel.org/

The series adds SGI IP35 (Fuel, Tezro, Origin 300/3000) support to
the IP27 platform code. The two mfd patches are the IOC3 side of it:
26 adds the IOC4 variant found on these boards and 31 adds the Fuel
system board's cell table entry so its IOC3 gets a serial cell. They
apply on mainline with nothing else from the set, 31 on top of 26,
but are only useful together with the platform patches.

Happy to resend the full series to you if you prefer to have it in
your inbox.


Thanks,
Imre
