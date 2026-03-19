Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465153F7E7F;
	Thu, 19 Mar 2026 20:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773952303; cv=none; b=ZsIGrT/aXMgn9KQa9A7D5Caaqhiuiq/stidb+ax9n0F4zUy8LpJgpp1C1UsmRVdgOhFbk8gzhV2TaR543v/dzureCb95F1as3+ygRhQlIjyILeb12/l9HEXmvVLyvSQsI6rw6EdAEeMSLCf95bB3QZAzhhdhaFrTMyYlIZHnZdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773952303; c=relaxed/simple;
	bh=Ja/UUIk/L7nyBTO3f9gnFz6ETxW+OHOCJEaLHZQ1y8Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=b0sA9Wl5BOAbtTEiUYcqBze1bo2JhjxevNyhJgBOlnALKG1ddNpXutv0Qvk43t+ulVqN1zSOfNwqvlrqL9nRtMBuVCM+tBIqf1CVe6tmCSxZO/uSl+esLkgtinbC4KC5mZ7UiXgRkinPd/jajfqRI2ev2GGvVu1yk182RVmoafk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VEyAMKwp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VEyAMKwp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2544BC19424;
	Thu, 19 Mar 2026 20:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773952302;
	bh=Ja/UUIk/L7nyBTO3f9gnFz6ETxW+OHOCJEaLHZQ1y8Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VEyAMKwpaxHE+i6D/loSFtfEZIMUMqNg4xq0JbFIHcFA3H92PcrP7o4hWGU8yXLB1
	 kWbTLn83B7oPUP9FA/vOoDVUZQ5KLLqOmw9awCTnEL4bY4eoTvYDwVv7xBbhVK4OKq
	 YGy1eqjQF14oCNVTgvsTLn22fCnW0UEhWMsfdxwFlvWhPxG397OonezG1/NHO2DOl5
	 6PGyugJjAfbhkkpx0zvPRkFJS7UGA/W7r5bnHutvrBkT5FJOUeg1AmNT2jiQRHiFbh
	 SnJovhr/l82o2Pj2fv3LarqJKf4eEKbf367j6Vpu78SxmaNIkGLuM079x6CXly1d4o
	 MyqYloFAaRx+w==
From: Thomas Gleixner <tglx@kernel.org>
To: Daniel J Blueman <daniel@quora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, "Paul E. McKenney"
 <paulmck@kernel.org>, John Stultz <jstultz@google.com>, Waiman Long
 <longman@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 x86@kernel.org, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, Jiri Wiesner
 <jwiesner@suse.de>, Helge Deller <deller@gmx.de>,
 linux-parisc@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, Scott Hamilton
 <scott.hamilton@bull.com>
Subject: Re: [patch 5/5] clocksource: Rewrite watchdog code completely
In-Reply-To: <CAMVG2stkXYJqrcaYpiPu0No=rTo8W+MxZZNZp6wjBE3sEphR8A@mail.gmail.com>
References: <20260123230651.688818373@kernel.org>
 <20260123231521.926490888@kernel.org>
 <CAMVG2ssXZKmw-YTKB5=CvhEofKeyEfaBCDZbyzfUcm2+P5rQsQ@mail.gmail.com>
 <87jywvfkrs.ffs@tglx>
 <CAMVG2ssvadzUUoZw9xdYdZ4T5Sz+xdcQnXmU2NkR0N_yqieT=w@mail.gmail.com>
 <87ms0zva5i.ffs@tglx>
 <CAMVG2st0c7zoh-OYom_UwSA7WPDfRuM7f9gmt4pzU=Ap1Bm9Rw@mail.gmail.com>
 <87h5qeomm5.ffs@tglx>
 <CAMVG2stkXYJqrcaYpiPu0No=rTo8W+MxZZNZp6wjBE3sEphR8A@mail.gmail.com>
Date: Thu, 19 Mar 2026 21:31:39 +0100
Message-ID: <877br7muhg.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Mar 18 2026 at 22:10, Daniel J. Blueman wrote:
> On Tue, 17 Mar 2026 at 17:01, Thomas Gleixner <tglx@kernel.org> wrote:
>> V2: Make it more cache line friendly and tweak it further for insane big
>>     machines - Daniel
>
> Signed-off-by: Daniel J Blueman <daniel@quora.org>

I assume you wanted to say Tested/Acked/Reviewed-by or a combination of
that. Please clarify.

> Thanks and great work Thomas!

Thank you for your help and suggestions!

      Thomas
