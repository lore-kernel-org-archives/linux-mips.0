Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEFD4746C0;
	Fri,  2 Oct 2026 10:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935328; cv=none; b=BVhmQgfyCCmZFgt5t+lUl3AfU9Fdk4N5nDvA8CD3XcOS8HfnIoxi/slti5JrfkRJbeM/DPmm4RlB3VxJAPSA59pludIwkm6H7dRJyW9O8SOxcoqbKxStc3AKy31xb/ENsTZFhLQg0xSTxGWAQLcNHYXk7bp5MECgY/m9dG6mqIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935328; c=relaxed/simple;
	bh=2qmJcoqiNXD49B1PmnaoTGVLX41DaXqByrpakOhFZ4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GmC9hkeoX5mJpRSOj/kTDpVAh56103jqm4Z049GYEshmRD8TD12FoRfAH4cjj9ZqAvOSoQIf7xnA8CGS7k5vL4NYrxG54AjAT4eWfjq08TvIGNBBfwqLCbXJEP4Ep3RjTixHFYFaw3JErpmMwiUhntTrCizz7xflU/tBkxaeJk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RtBHZBSY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RtBHZBSY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66A121F000FF;
	Fri,  2 Oct 2026 10:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790935327;
	bh=56E8XzZ+C/jYCSXWh8CtNSN85hX3wCL6QykMnsd9Zok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RtBHZBSY3QVswiPpTWH4a0r4EP9y1FfwAzmPEo3KRTqY6poOifJd7UGQkAPv/l8I1
	 ECypJZ5wdTtaWSxXu3ix2AzBMSJeUWxJ+OpJmKBZ/SHxcAIhHpsXT9pNU3u+kWAz3D
	 X1zS9MadaCLXPq/pDIEY0Ah5ocFU8Cn2qCYOLEu3EPM/35/gAV4oZHswa+tUZ2WMYB
	 zmxXsJT4G0N9Zk0l3gWGvP+5ujvfRjhoW6eoZLVcECNmmLSrhxAIRQaXQtCODaAFqf
	 NODD6expUi3ETyTziZTFX3JT7I/PLBwn1mOhIWTtdvLlZQX7378BbKQ8xwD7wh19T+
	 Y7798FIWxAduA==
Date: Fri, 2 Oct 2026 11:02:04 +0100
From: Lee Jones <lee@kernel.org>
To: Imre Kaloz <kaloz@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: Re: [PATCH 31/38] mfd: ioc3: add IP34 system-board entry to
 ioc3_infos[]
Message-ID: <20261002100204.GB13860@google.com>
References: <cover.1790857966.git.kaloz@kernel.org>
 <e9b125b8ab2422717072f447c318eff41062bd79.1790857966.git.kaloz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9b125b8ab2422717072f447c318eff41062bd79.1790857966.git.kaloz@kernel.org>

On Thu, 01 Oct 2026, Imre Kaloz wrote:

> Register the Fuel system board's on-board IOC3 and its M48T35, whose
> year register counts from 1968 as on other IP35-family machines.
> Bridge-side detection was already merged in commit 2c4288719806 ("MIPS:
> PCI: Add detection of IOC3 on IO7, IO8, IO9 and Fuel"), which matches
> the board part number "030-1707-"; the cell table had no entry to go
> with it. Without one the IOC3 falls to the CAD DUO default, which
> instantiates no serial cell, so Fuel comes up with no ttyS0.

I received 26 and 31.  Where is the rest of the set?

I'd like to have full context please.

-- 
Lee Jones
