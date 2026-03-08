Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF0B24337B;
	Sun,  8 Mar 2026 09:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772963617; cv=none; b=MEcJU7IWgTwMfTLOzFLXh5qbHeVMte4mtCLP/FKgNiwW23Ys+SlZkWG/IByE1fz6lXH277pUr/gUqVtJ9EaynpIStGV3LgrkIZ+VJHQjbDj8KlzylVu9tvAteH7JmXaPymj7xzHKnwF7WuqKzZmx0lf9MYT4bla4AtlJcgwYdtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772963617; c=relaxed/simple;
	bh=YpZtJeyi3j9I0kfeXGeyMC/v7uGkAInhYxZIAZcLHiQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MUt/xVo9SbeSRAqZ/rs9+RcbR4UyJyAHjGZ0i9O35nvSTOqXvefa7TMz1QeBHBGwEEV3Nj8W+OAFvUYsHERlrJICjAikwedLJ6qzZL7fVAEckKBogIzPv0jqvI3fAsXZ+ntMSTmhxfvOVtTZv8zuD9gHeTFFWTcyNZkKMD6boVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RTvqX2Cq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RTvqX2Cq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32853C116C6;
	Sun,  8 Mar 2026 09:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772963617;
	bh=YpZtJeyi3j9I0kfeXGeyMC/v7uGkAInhYxZIAZcLHiQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RTvqX2CqsybrPAeVVoaqazFAFJGPkzei6O1n7GY6qEkv/iYa6ukUEu/sS4eQnM78A
	 WR5rowPbwDsAaeuq0az4AZS+jNa1eDlcvcmtDEo4J5x4dcJzgLMVLTVrEZ+lzMLSxU
	 px2sMA+SBJpkVYHNsU67xLXUuQNCwCuG4YSCNz/IfeBpO+1szqfsy7b1FRJ4MqgKa6
	 yXz2NjoRBL66CBeMhyDgnE46+3zNstyZJhWXSiuvddb27D2U2gtOMJTvF2vFsUawZR
	 W1rTO+qCe73tKbQbVsFX21SE4hm/nJcevFlDr8H/aqUhD85PPNTu7m/JQsikdRK5+Q
	 QGQqHRMjy0UDg==
From: Thomas Gleixner <tglx@kernel.org>
To: Daniel J Blueman <daniel@quora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, "Paul E. McKenney"
 <paulmck@kernel.org>, John Stultz <jstultz@google.com>, Waiman Long
 <longman@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 x86@kernel.org, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, Jiri Wiesner
 <jwiesner@suse.de>, Scott Hamilton <scott.hamilton@eviden.com>, Helge
 Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org
Subject: Re: [patch 5/5] clocksource: Rewrite watchdog code completely
In-Reply-To: <87ms0zva5i.ffs@tglx>
References: <20260123230651.688818373@kernel.org>
 <20260123231521.926490888@kernel.org>
 <CAMVG2ssXZKmw-YTKB5=CvhEofKeyEfaBCDZbyzfUcm2+P5rQsQ@mail.gmail.com>
 <87jywvfkrs.ffs@tglx>
 <CAMVG2ssvadzUUoZw9xdYdZ4T5Sz+xdcQnXmU2NkR0N_yqieT=w@mail.gmail.com>
 <87ms0zva5i.ffs@tglx>
Date: Sun, 08 Mar 2026 10:53:33 +0100
Message-ID: <871phu3aw2.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Daniel!

On Mon, Feb 23 2026 at 14:53, Thomas Gleixner wrote:
> On Sun, Feb 15 2026 at 20:18, Daniel J Blueman wrote:
>> On Mon, 2 Feb 2026 at 19:27, Thomas Gleixner <tglx@kernel.org> wrote:
>> Good step forward! We can also reduce remote cacheline invalidation by
>> putting 'seq' into the cacheline after 'cpu_ts' by reordering:
>
> Good point.
>
>> With that said, with your latest change on the 1920 thread setup,
>> WATCHDOG_READOUT_MAX_US 1000 is still needed to avoid timeouts during
>> the previous adverse workload, however some timeouts are still seen
>> during massive parallel process teardowns.
>>
>> To limit overhead, perhaps it is sufficient to set the timeout to
>> 100us, avoid retries (as the hardware thread may continue to be busy
>> and will be rechecked later anyway), and log timeouts at the debug
>> level if at all.
>
> Something like the below should work even with 50us. I left the print at
> INFO level for now. We can either change it to pr_info_once() or to
> debug as you said.

Any chance you can give this a test ride on that 1920 thread
monstrosity?

Thanks,

        tglx
