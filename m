Received: from alg145.algor.co.uk ([62.254.210.145]:51206 "EHLO
	dmz.algor.co.uk") by ftp.linux-mips.org with ESMTP id S8133415AbWAJJd3
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Tue, 10 Jan 2006 09:33:29 +0000
From: Dominic Sweetman <dom@mips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <17347.32817.144103.968382@mips.com>
Date: Tue, 10 Jan 2006 09:36:49 +0000
Subject: RE: [processor frequency]
In-Reply-To: <3CB54817FDF733459B230DD27C690CEC010495E3@Exchange.MIPS.COM>
References: <3CB54817FDF733459B230DD27C690CEC010495E3@Exchange.MIPS.COM>
Return-Path: <dom@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Mitchell, Earl" <earlm@mips.com>
Cc: Wolfgang Denk <wd@denx.de>, "Kevin D. Kissell" <kevink@mips.com>, Sathesh Babu Edara <satheshbabu.edara@analog.com>, linux-mips@linux-mips.org
Message-ID: <20060110093649.HN7mvC9R7o8cT4lwTx1zGRNblq6RS2t60tDgfr8aLGk@z>


My colleague Earl writes:

> The desktop/server guys typically use much larger caches (i.e. >= 512K)
> and most have L2, compared to embedded systems which typically use less
> without an L2. So I'd also expect embedded guys using small caches to see 
> larger decreases in performance due to more cache misses (i.e. more 
> interrupts produce more evictions). 

It's certainly true that running an interrupt routine (even one which
doesn't lead to any scheduling activity) will cause some cache
traffic.  But it is important to keep the relative timescales in mind.
With an averagely bad memory system, evicting and replacing a cache
line costs 150ns read latency, with a 100ns writeback (notionally done
"in the background" just after the read) on about one miss in four...

Let's make some pessimistic assumptions.  Suppose an interrupt routine
displaces 2KB of code and data and uses 32-byte cache lines, and we
assume the process happens twice as the background process refills the
cache to its liking.  Then we'll get 120 odd reads, which will cost
about 20us, about 2% of total time on a 1KHz clock.  That doesn't
sound like it should be a huge effect.

It would be better to measure it, though.

--
Dominic Sweetman
MIPS Technologies.
