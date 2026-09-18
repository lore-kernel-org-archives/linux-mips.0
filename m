Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B2537F8C1;
	Fri, 18 Sep 2026 15:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789745425; cv=none; b=pLLHa87JWcW4Bbztn0MfZBSpx+yatRwSbEA8awWJKkKzKwPBZrifd3Yk+Y1E/ZTPuFFiQyncGPrmkZwgv1uem8IzCpRse+2ThiK9pTK8/J7jrpQSbFPrrzANzQZ2e/uRIT86hpBTbnjjV2WUDSX1BFKYmdBEjBXBWcHnNM0TZ4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789745425; c=relaxed/simple;
	bh=m0DknOOqEdbXGEpq7Eh5+FQHFEx79+KaLHRPPo/Uh/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tZE0K65l9r3yGlYBMrwbHWn+yLb6EHxOliEX2vRvMizMKS2XAW6zyxCm8xP44S2xiFzzLogspdrtedqAMCH4vPqueGgJTivWXWwKFNtVlbHAQb3a6xYTony0buYGGCQPUDXja/dp/FnewHC/D4DWs/h6d6aQHi4lkPbkGT4zCcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=e5aLHUO7; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="e5aLHUO7"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 365BE4E0B89;
	Fri, 18 Sep 2026 17:30:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1789745419; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Jxqwyt6VaOzRpU+WpKOB7tHmcDzh7U4x2sGOF/SNj3E=;
	b=e5aLHUO75rmv85DqXnf26I+4dDnxykkecLbfKvnlE/eeKZjl6bvxwDCPVX+mz88NvMNeRC
	RDeSgwyNhWwkXvirfQIThBxG+o92gdw1Q5dQz+zAvsFZchnsri60u4T66eaa8xIfGMzcmT
	aiRc0DbpkChiEAF+LzmeWn42/JWzjv40Tl3b/1B3DsYdQPq1X49PSuZi+xVYQcZ66+XLxc
	yosIuHcrpa2s09bjW9dRqyLpf4R54NKEWNirCieIEvInDxT82D5eFBlNinuQu5hT8UnYuj
	kxsBZdffvZ7eygH5hdeOSeJucZO1EUjiPEBc8Ltd0xJA9H8fIHs3e/7qKL/dTg==
Message-ID: <5d6c9811-b78e-463a-983d-8cf1d2ed528b@cjdns.fr>
Date: Fri, 18 Sep 2026 17:30:06 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v7 0/5] clocksource/timer-econet-en751221: Support irq
 number per timer
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
 linux-mips@vger.kernel.org
Cc: conor+dt@kernel.org, daniel.lezcano@kernel.org,
 devicetree@vger.kernel.org, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, naseefkm@gmail.com, robh@kernel.org,
 tglx@kernel.org, grandmaster@al2klimov.de
References: <20260731120246.1296955-1-cjd@cjdns.fr>
 <4917ef30-0ed9-4c5a-8516-1033b5f02fdc@oss.qualcomm.com>
 <f98f17aa-0f95-4b03-9f95-385e8af762df@cjdns.fr>
 <560064b6-73ca-4895-8415-b252b6824147@oss.qualcomm.com>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <560064b6-73ca-4895-8415-b252b6824147@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

>
>
>> Any suggestions would be appreciated.
>   s/%d/%zd/ ?
>
Thank you for the suggestion (and for remembering this thread which I'd 
almost forgotten), I have just applied it and sent v8.

Thanks,

Caleb

