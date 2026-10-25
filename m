Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792955999;
	b=U5hc71Y1KZ9ey9p06ayzEiNlmER+fymANiUv2P7FJ0DkHlxH8zLY2gJLhl4W1D7WA8jX
	 HVQS2hZFDJyPLKAQNxiqbMmXLggrzLfoMac9pyoaCFZ2nP3Z2cEnlBfwJdb/ZWWWa5GLK
	 9n2SILeTn2zp0RA30iwIotMnsjg1eTcm/nDSU2pI6MITw356BULVy9d9a5/WBSu4Dpk36
	 QhpqeF3ekmt6CAC8Og6ffYOX9Jby+2reHgFOBdCnM5gfrP0Nr+lC1UagG+FT8w8TQtnpm
	 z5lJtvUnnd5MhDOF2RBx/CqpC8JTHRczTLRb82Gbm6tmUKLMLi1+3O/wVXx7FAqiM5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=WCgwFDtfTJTyMxxPB/i3TG8L8ZoI2yM1l0zgDGnEJFg=;
	b=LYbQRQtHmJDrdhoRqNvq/7uJynG10M2N9P+R4lG1acE+iNn5kSQSXBrE31v1YVq0NYug
	 +/nd0KOSY8yTChBXkZseF8DM4taA3dHGAjvp7Mo1gp+R2Kzg4G60Tv5csdNFBXnAgT9Ew
	 XELDQXUq0hfRM2I3G49jf49jnwBcoYO450N/Z5aKGi0iHkCWB8CSNpLkdHUFvuWTS9CW2
	 R4oSB6kj35COBS3NJRwx+9fgSKclQ8Nfx0QJc7zUP/80vzfd5R07e9xAxW05bEkr9GoXn
	 u2ecpDFhKkgJ28fiG+Mhc8ru39cYKeUFiUcxpHmFi5HE5DF0Wsz98TGRimOZDy7tQbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KoyB3i6x;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8EA606A335
	for <linux-mips@vger.kernel.org>; Sun, 25 Oct 2026 19:19:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D8EA606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KoyB3i6x
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15dd124bbe7so1380013c88.1
        for <linux-mips@vger.kernel.org>; Sun, 25 Oct 2026 12:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792955998; x=1793560798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WCgwFDtfTJTyMxxPB/i3TG8L8ZoI2yM1l0zgDGnEJFg=;
        b=KoyB3i6xaZsFLoXQqvdb5LVBXh7TLCe6dqoBruoOd/Qm22FpuhOLM4WIndM9mn216G
         tQDu9OCapXeKxZrPUNVZY64aRJrYST3s9dW7JHQi8KWwg6tx4HNc3cfrmvVkUWzBMKT9
         gbGMu93pLc1SD1Ht55DL2C3g6Fy/FCykETBWTSdadOdCbBGZ65s/P+ZA0ydgmKczdsOE
         d95BE1N5CB/m/Wi+CPKboOIBzKc+XsWxQd43SvPfFYPcMnQ7GpCkFLigFvAHbtd1RH06
         3CJBQ+D4V6t8WbaQec3ldPIhT9yhgfJJh1OVs9YPU0sQt9vA3Pi+YX06Gcgu4YDD9ph0
         ffMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792955998; x=1793560798;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WCgwFDtfTJTyMxxPB/i3TG8L8ZoI2yM1l0zgDGnEJFg=;
        b=VriLviFaJZ6x7AOfqYWcsoH85ijRUQUKVTVK6JFhtPYQI5or02cbVkqBfvsvuUQPjb
         4h+ypdsd3n/k22/yFAH+g8s16EobG3yk70DhLrbVsh44nl8PdGODHgW+ilElORZCUziz
         3bCnK4bbcDrVIqI5JBVRvXY6uU1Wp1tMUawUiJ2cSGDDojM90GupeQTNk7/mN+z79Qlp
         EpCNFsgcHrCh4YkoCjIP89ysm1XpwLxqW+sAuX3Ncc3NDDYpHhADvjgZAWUb5DTIXf+Z
         xs/qbza4kmsPp5cWOdxzXDxPxq+xzyp8qpIamyPZRq1BA8k5RxHb6WzjyXSkuGoMfpED
         JfNw==
X-Gm-Message-State: AFq9FYIhcZsSf5vWxNRJX6hlbifKQaA1IpdA3PJA6071fzKkjXKb3yG7
	RUFcvGEBhv3rao37EqRVGf3lBQ19UlNChBzChflF9Nr0bi0BiQ9fnOMy
X-Gm-Gg: AYBFou2ooFICsaZiSQ3oH9reeFtf0f31HvccLgQtfovQmueZio8SXFyW99ScPl38Sgj
	PG8weh08e97BH3WOVwxHRir1s2cy+fAyeHP/NyAM/w5EwHesUEZUOb1aqCrjIPuD6pneiF+kqGS
	c+Fjjkh33/vpZM6TBI70swnJibDKCX9ZB2C54+zfkcNGsLn8Sx5Ha4+fEOrZ4csNQLt4Ri2+Ynx
	vTFSm4RD60NxK0JxkRh9pJvDxCA9W1fkCIorZi4QOqU839ydAKuu9LSQd0vcLVR0OAjA9kftB4J
	s2yZrwendUIsaGI0DwyP3ZEbToo5dK6GzZ6FbJAvGFzqWDH9kdAmj5a9PTZBDVZ50RVqZ5V6nk2
	hRLpr10aCOiJsnHeHio+obxPpC2AhcPrwBbPqIl34seFuUR8VyVs46t2vgFSq7qlE6GQQpF3aWE
	8Wpd24LYSSvGnyms1kmFx12ux8aQFUHacc5nAZKTmYBTbBOeDTHKhNqO8t5O2FLptetlWcXUoH2
	1nz5gA1StKUvSzaJQAr1C+AP1W6qvHiXJSDqD4Ue/tzFzf2BUPHOZ4A4+lPPK279UE65TkdrMws
	yKFjTEe2sg55ivHJogtxarkLbHawqw==
X-Received: by 2002:a05:7022:5f14:b0:144:de98:eec1 with SMTP id a92af1059eb24-1993571a23bmr6933077c88.11.1792955997486;
        Sun, 25 Oct 2026 12:19:57 -0700 (PDT)
Received: from ?IPV6:2600:8802:b00:1f81:d121:605b:ad3:d032? ([2600:8802:b00:1f81:d121:605b:ad3:d032])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369ef6a71easm16319342eec.5.2026.10.25.12.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 12:19:56 -0700 (PDT)
Message-ID: <96828518-81e3-4c58-b9c8-65f46beb7111@gmail.com>
Date: Sun, 25 Oct 2026 12:19:56 -0700
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
Subject: Re: [PATCH v2] MIPS: Cobalt: Include legacy IDE ports in the PCI I/O
 window
From: Florian Fainelli <f.fainelli@gmail.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>, open list <linux-kernel@vger.kernel.org>
References: <20261022163106.1410595-1-f.fainelli@gmail.com>
 <alpine.DEB.2.21.2610250247210.42255@angie.orcam.me.uk>
 <ff0e6a32-af88-432b-a976-2a432f625cb2@gmail.com>
Content-Language: en-US
In-Reply-To: <ff0e6a32-af88-432b-a976-2a432f625cb2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/25/2026 12:16 PM, Florian Fainelli wrote:
> 
> 
> On 10/24/2026 7:55 PM, Maciej W. Rozycki wrote:
>> On Thu, 22 Oct 2026, Florian Fainelli wrote:
>>
>>> Changes in v2:
>>>
>>> - implement Maciej's suggestion to reserve PCI resources first
>>>    and then the rest of the peripherals
>>
>>   Thanks.
>>
>>> diff --git a/arch/mips/cobalt/pci.c b/arch/mips/cobalt/pci.c
>>> index 85ec9cc31d66..29fd052766b2 100644
>>> --- a/arch/mips/cobalt/pci.c
>>> +++ b/arch/mips/cobalt/pci.c
>>> @@ -14,6 +14,8 @@
>>>   #include <asm/gt64120.h>
>>> +#include <cobalt.h>
>>> +
>>
>>   Hmm, why do you need it here now, a leftover from testing?
> 
> Yes indeed it was a leftover from moving code around until I settled on 
> the current approach.

Actually I take it back, it is to provide a declaration for 
cobalt_pci_init() otherwise we get a warning with -Wmissing-prototypes 
since the function used to be static and now it is not.
-- 
Florian

