Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792812082;
	b=S/Yn19pi3sgJ5I79aUjMB3ahuSJAjlclRZvIfzhMtQkeoIbgvFhl/uXJ48rCQXnKPOVX
	 nJr7WHG4rNimAdaT8ieBBMVD4gC4YDFU35WzrrSBAJme1yfCId4YSa7TCDG+Nae1gvKWk
	 24GRHFaQDhXxfFjzep9o/X9LMVSX2br+kelA7aTn1bbIYtn9zaYo75pVvxS3cKeVV2DF2
	 gLOlgmVR+jOWh69CmhIISeK9jBJnG6YWEix5fhcVY2yVxg0LoOtTGoWQxxHhB1MJzLx1F
	 Mvzfbedo4PIt5eEQ4/EA6S4w0DzEPatjEWDsNJ+oSN7poiRzWN40iRu+oRcLIKuqPTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792812082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=jS7Czz+wiu7WFrzrtvYg+PFvQraU5/rTwcpARPMwsP4=;
	b=PDAx3IqCwWVny9MIQF76jhICc208Qk2xdTctMSSLVNCiJ0yyTVIep1DXHYSrreLXlgV5
	 UrdyMY8L3IO/Jp5kMnuwaDPqn+wYZN/ni8X1WUVs0Fu0CzCyYzrMALndyz8vw7fuh1rty
	 CWVULIAR1xn3djtdZbJZL1TXzUnDN9BfYl7kwVHdAtMesV1b1CRXAJ0aIN/j7Mpc4A09I
	 5YL5OT9jKPkml5Fa8JiQPnG55PptItjSy0lr0W+VSfM1WhOJAuLHyI5crCpnCxw427kzu
	 gt2RMr3vjh0xKErmDhppJhX4evMhDFam0w21IneO0xYfsna/CqYX05lcy5OTRV6YowA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QFYU8gQh;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25831606A31D
	for <linux-mips@vger.kernel.org>; Sat, 24 Oct 2026 03:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25831606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QFYU8gQh
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-353804b591eso2508463eec.0
        for <linux-mips@vger.kernel.org>; Fri, 23 Oct 2026 20:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792812081; x=1793416881; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jS7Czz+wiu7WFrzrtvYg+PFvQraU5/rTwcpARPMwsP4=;
        b=QFYU8gQh0JIU/1g52xf3dEHUMnFoatncMZt//oVQLvOUORQ3+YpGk6I+NlObMEnGtG
         0wUOG9usTSJR4MqdM4LoI6Qyit2Ydh6/vnmXXKXp6TMfZlQC48aNe2TyGiEgFho1Q6dm
         lhd8pjeM9yZ0lxMZQzazMovsYJDTmyJTatJ9/g2sy/E45676EIAnohGaMbXW3ypR1qkL
         8ucgiCaXni/7EuO7B/iNmMvwElKPWr17+bCCiCYNVPeFou1cs3+oC2u4G7r2HcMXuk5p
         8l0cqwM50t+/tUVPbSa+fBP84Baa84M2VB0ehYRcarH6ZtFaTPT4DMWAwA3d39r56OqJ
         ATkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792812081; x=1793416881;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jS7Czz+wiu7WFrzrtvYg+PFvQraU5/rTwcpARPMwsP4=;
        b=pG31QEGK2QKwvlEQ7urUM5EGGruLwAXvcLPGDysQgny1TlXVQ22He6J5KHN4zgDZ/c
         3l/HBl7gv2BktI1HQtK88zdUPm3RoXfe09L3vv/UkZm9ZD+l7Q4R7J8KtV555VJRoqoB
         UxKbB5FvhGqkaM5+qr2lxoZUfgFNdAe+253NEr5dbxSeUKy5P9LbH9RZoUOYxnNDvfin
         rp1A373lU825beEcovm9IpcQOojz0ZpyZATaV7kmIJ9w1N7vyFn8dcjj0FScHSp2xQus
         y+jSwDi7/RUClrkWP67mSdvup1k89omSR+sY9/vF7UnDpqdISvbnForCVz+xXdJ6WowD
         l1iQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmMh6+A0fxK8n+lAHs9eF2Aa0IHfrTO/bFOlpo9RLoXkvS2epMPfLhwAldqU/tArPfYq4RS0B4BkrD@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2FhWBwXjtEsQtoMph3sTB1/hTylvTkDo1iGP6eBFhUCsWFXZ+
	ov8GFnU6mu7RZz/8aAYpnNZ5gWoi0v+A4xpfCHBcz06Xm/9rhU2ygIBZ
X-Gm-Gg: AYBFou3knnZrF+xqcwwQz9VxsvqULgfpueTads8mqavLMNxYKoxFYwrPhzcvrAobI4H
	JLiAlM8PYKnlcas38+9TaiDKlXAT/i0dxUhd+V5/5JFYrOA/Abrjp0S2ZptaIfRlvL3puHhHyMR
	YNk3mGoZSsWjTcxNwPzDeGdVwhDq8FJCq6GyRibG4BwtqRqsV057yzhPsjXLRJ1idYMW5qEPD26
	IBmEyuW1pbqGFgOvGm2aDi7W17Hesxstfdh/SHES4LKDuIoseCp3yBK0QgpiaX1wBwjKF2YpQxd
	9n8FWcgQoTtUI/z7SeRfdxHPyJhNBsCeuYNwaIAGb9dlBSYD0uo7mCuJF8OHJFnRdyOlfeMXgSA
	J0efNqregcWDq4jDtfsihObTfpOs2ag2nGclnPYGyjWL+/nEcGlmEISKlHQaAEQYo9tIkuXMquy
	1x/krTTbCz6GBbOfEf3eIbLf0WrYowPZk8TcboMxxq7JF2biZ2+T3Y8wfF1xOOIJlUp9RCk3Uc2
	2Rbr8EEiQ5NI6uRZYiqOIqNqCwqUHDmTXqnQofK/OKKK/pxyVujAQ53Qvrs+vXn/KGKRRjrWyZ8
	eYvOH7PsStrG7vHuOPtxc3Rz7+UxUuMq
X-Received: by 2002:a05:701b:42cc:10b0:14d:3c0c:79e9 with SMTP id a92af1059eb24-1993505dfd6mr1266066c88.11.1792812081124;
        Fri, 23 Oct 2026 20:21:21 -0700 (PDT)
Received: from ?IPV6:2600:8802:b00:1f81:ed84:76da:ac36:f699? ([2600:8802:b00:1f81:ed84:76da:ac36:f699])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0f81ea9sm3107744c88.11.2026.10.23.20.21.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 20:21:20 -0700 (PDT)
Message-ID: <fc0dd1a5-70ed-4c4d-84e0-94080dd5cc38@gmail.com>
Date: Fri, 23 Oct 2026 20:21:19 -0700
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] MTX-1 watchdog driver removal
To: Guenter Roeck <linux@roeck-us.net>, linux-mips@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 Eric Biggers <ebiggers@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mingyu Wang <25181214217@stu.xidian.edu.cn>,
 Robert Marko <robert.marko@sartura.hr>,
 "open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 manuel.lauss@gmail.com
References: <20261016221617.2223004-1-f.fainelli@gmail.com>
 <85d47f47-1432-48fe-b83b-4d53381c5461@roeck-us.net>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <85d47f47-1432-48fe-b83b-4d53381c5461@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/19/2026 6:00 PM, Guenter Roeck wrote:
> On 10/16/26 15:16, Florian Fainelli wrote:
>> This patch series removes the bespoke mtx-1_wdt driver and migrates it
>> to the generic gpio_wdt driver which it should have done ever since
>> gpio_wdt existed.
>>
>> Assuming the patches are satisfactory, I suppose it would be easier to
>> merge those via the watchdog tree than the MIPS tree?
>>
>  From my perspective, patches are ok, and I'd be happy to apply
> them through the watchdog tree. However, I would need an Ack
> from a MIPS maintainer to do that.

Thanks! Thomas gave you his Acked-by on patch 4.
-- 
Florian

