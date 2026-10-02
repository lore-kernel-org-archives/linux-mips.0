Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9547942E8CB
	for <linux-mips@vger.kernel.org>; Fri,  2 Oct 2026 07:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790926064; cv=none; b=EP0SkRph2QHvhl+TyabGXqm06JY0WYoqpG9zGAnIpeH5L40QPY6iz0oNW12NcH3FdwLxaU3imff5k2RnAIDDGDDN1/Vt+cBfoct08zpZmnnd/dhbVr6ywjmC7uJpmMViCdzkcn0319tqkkAdV9z0i+WL7MXZQjw1AOEhq0N4elY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790926064; c=relaxed/simple;
	bh=vFn9KjKsMYiAr1ZmjI3CN9vbnCY4NFPwuUVqfyJJ0J8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NHiib4weX6T7DgsB0on9t39gxd8rt/Umhzt7foyPfemmYRucBATPnoCXEqfnOG14CLt1hVzDpoZorORMhZtDqKOZ91oUTQNOyXdtGKOzpTwrA1mWPdphjJoVsqjgK3VxOu0G1MN1/EIBbMzlDHuvdUk3NlHpYVWp0aIDUsl304U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eXT1IPgm; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eXT1IPgm"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ffbd83a92so49217535e9.0
        for <linux-mips@vger.kernel.org>; Fri, 02 Oct 2026 00:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790926059; x=1791530859; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=71zvz099KWIJK9SNeemZUNmD6UFsAC9SZckopHPDOTA=;
        b=eXT1IPgm3ZquEJPCD41j6+rHlnnVP+LNwo5JRIxszOcDKyjmZWTAz46lsPsO6JcGOw
         yZy8GkFxMlrpjJ2v3SqaX5vrO3uX+/IOQ3H3b2pQ2jmcHkenF4/QcAA+B5UtqyWD6Xdg
         +AEVVgAsc+Z7pnUudEg+2M2En+ZVZAtwnWXNWGfwoTr3QDV2WRgzfPnSzzUGWEIFrA4o
         mLYsiAivANr01DVTrCnOf60op5Kx88i43v6X8CiMWaCDtvIb1ak6eTxOGg9bhwjudM5t
         1jPaPZjvQeAydEun+6IS3J9mjkJc/wnKRhK4GwgPHWapcoTRAnr0lXiR4eylELIIq+bM
         3jIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790926059; x=1791530859;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=71zvz099KWIJK9SNeemZUNmD6UFsAC9SZckopHPDOTA=;
        b=1om1bYapZsEb+9/Yuo1jFItfBFEsZ5radscuyo0NaF4JWr/P1NMyQHI4yrZvesBlaa
         03N6TCp6r2RWh48GZWKovRRceT3cXqrZZJcDZDqUr/+8w9G7/WDWCoTGb5J6leKDODwM
         p3m7kBIIHLFJDoYJ/1HZ7eRYsfy/2IpKR2xPCv01XnYCn7AYq1ifC+J93+JUF8yhnUP/
         1d+Iq+fmLfif4M6OCi4PhtanBczVNxVSlo94SzArxK46uhWpGrcWxcyovQSnlqxf82Sw
         zCh3arZoSQIH5ciwLvotc9FsxJm+CypDQFIrNTff0jdoG2u4Zj/eZNqtfuDrfCpjZpUx
         78fA==
X-Forwarded-Encrypted: i=1; AKwUvBzk+7XeHPouWx9tDXTEOlTi+gmy+WDJ4surRNGxuId3C8ONJtLNaIT8BwXSUQ68y22P+/zb87DO3zfw@vger.kernel.org
X-Gm-Message-State: AFuF++lD6j5vGAUXzU5yVpKMCuV0ekV9wXoty0r0Bd9bn/bZ5LOXu0GT
	vmrmtsI3mi2plHkTkUHiQF/daetQjTGc4KRAjnFYJW7anOi99zSlmpZ5/AUeVtm2WwsiQ7enbAL
	gHujY7HU=
X-Gm-Gg: AYBFou1hf7wZlFYxK6bwV4tw3hvEs9zTxiyd0mSQmu0GrMW73Q52InMnkqqWFJTIOWY
	z/cL65nCaUDkg48mUxQO0QcJy+x+SMXpnrDFdpKDvkswEmX+qeNhGdVRbYZN3Q49/tkKlK/jCAp
	AKvkBAeROC4ruCYCv8V5cOxNmOZkCme9V+T29xOXPk+d4WsEs1MLej+g4uD2hlZm2G8/mtbdx0m
	ofLPnbb0K+8Ki4/0+zKt/7f7vBfmA+bkZzCLbiCxMIuagQm2pabsq42soXUSbjFWSWncZCMEi19
	qu4DOQvIK8FZj18M2i48jT+E1nvTZY0MHMNXF5YkDsyHPEd5FXUZTlSmRuXnomvV7DBce4KpPLm
	ndUts4v8ASwk+3kyNEOR9BnTLknezekw4u97OjcusPDlrnzzUPTkrafzKr7OHe2+tEZUkd1Q0Lc
	+qy7iLpHqGF0Es4Dql5r45S6Ll5vAsN2B6Wo63SZuymXzYCS7grBgX01VIm8fIv3DC50eRkWyF
X-Received: by 2002:a05:600c:4ec6:b0:49d:1cc7:5ec3 with SMTP id 5b1f17b1804b1-4a02756637cmr33367355e9.9.1790926059441;
        Fri, 02 Oct 2026 00:27:39 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff3cab2sm19060475e9.2.2026.10.02.00.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:27:39 -0700 (PDT)
Date: Fri, 2 Oct 2026 09:27:36 +0200
From: Petr Mladek <pmladek@suse.com>
To: Imre Kaloz <kaloz@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v2] MIPS: SGI-IP27: print the NMI dump on an nbcon console
Message-ID: <ar9c6LwwwRbKW4fp@pathway.suse.cz>
References: <20261001191938.3256-1-kaloz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001191938.3256-1-kaloz@kernel.org>

On Thu 2026-10-01 21:19:38, Imre Kaloz wrote:
> Since the 8250 console became nbcon, printk() in nmi_dump() only queues
> records for a printer thread that never runs, as no CPU leaves the NMI
> handler. Print from an emergency section and flush pending records
> before the hub reset.
> 
> Fixes: d3539347022a ("serial: 8250: Switch to nbcon console, take 2")
> Signed-off-by: Imre Kaloz <kaloz@kernel.org>

Looks good to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

I assume that it would go via mips or drivers tree.
Please, let me know if you would prefer to push it via printk tree.

Best Regards,
Petr
