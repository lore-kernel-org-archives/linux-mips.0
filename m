Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619047;
	b=x/gOltdM+Z7EhMyXfmHfSTbkh0GuHC+8OV2bpnKJqBAonmAxJKAg2RFDwDQVuJenzqzU
	 44Dw+gl0Rwx93xtzAOozt3pdqFyyDSPe/xe97eV2Zwz89t06wh3CyH32M0yHZp3XMGIsh
	 5Dd13uCfEbj6PcH1uLtpVb2dSRNSZoMRMX7IIQl6AEvORmBSxvhQCpyCtTAEUhDGc6wXh
	 xgwC57DW8+u4eOU+5UEZQjhZcQVAIJeOQix2dG5TzTW9kQ5QisM9uMpzm5+BJMfgkRlJT
	 9LGGTa9T+EQRTK2piLtUlPNjNC1Ze/Sg6S3Md/9E7ieb7M5zVpJQkXPnNnW8oVLmkSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619047;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=aHJBn+g0eARKwK9BkSxKf1f6PPt9smBz3JX0wAyqVaA=;
	b=HqB6SBrm2P3aza8M3c75Zsup6RjdIPy/gWDhJW7gZpHzhxqEr+k7tmVm0kOknxgFdwEL
	 xVxPeqaorsDaJ1pMDoeeLub5meb5RrPWGppnNZkuc2+0eZTkK8PIJFuwIZ1Mdruhyarwr
	 AJX4SvzHDVZu5tx1spMw5ANDyaBWS1m4LllLIM1xv2I2ZKKV3yPXAsVy1uci4apxx2DAa
	 37eAmJZjjS9tUD4rUpOg8mTlQybknlbjtFev/x1+IDwCRnAdRxXvfC0GZHko84VPZBTEw
	 vkB6ChOctgTDHP4YMYlJtnbIoFqZjjRP4n3e4Lv6srFoht2TGZrgpxBfIZH1OkhyHwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dNuGD8Lg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309B3606A327;
	Mon,  2 Nov 2026 11:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dNuGD8Lg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 302971F00A17;
	Mon,  2 Nov 2026 11:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793619046;
	bh=aHJBn+g0eARKwK9BkSxKf1f6PPt9smBz3JX0wAyqVaA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dNuGD8LgQODzYeOxXHK8a7uruefObPbN0BlknZpcU5RPuvHOFVu2CPGIsXnK+UDDB
	 Smjj/mXtfNoNC0qw9LOiyoSa5mn2vNjNmplNUDxqNgjGAUP41v/Azp1p9hM65Ht2yV
	 mjcJnVFNqEvLHUfknlID0dsJvq2vMR2s//59l6G7JfVmDniRIW3XiK8DIVXQLT9Oxg
	 9jd0GTkpCqww/OjsAcOhbMoOVLe5s2yz57bPE6Zu9WWar2a8BMcZSIS6im+xiMHnbI
	 IDyp63bgiHh17M5ifC2FbLKKIHPXURhAZjAZfnyVWrj5PAgcI8m9eMZ7+30Grrg0jA
	 yXHrzjsci8sWw==
From: Imre Kaloz <kaloz@kernel.org>
To: sashiko-bot@kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev
Subject: Re: [PATCH v2 2/2] MIPS: SGI-IP30: shut down cleanly on a power button press
Date: Mon,  2 Nov 2026 12:29:29 +0100
Message-ID: <20261102112930.18911-1-kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <sashiko-outbox-193229@kernel.org>
References: <20261102094106.21300-1-kaloz@kernel.org> <20261102094106.21300-3-kaloz@kernel.org> <sashiko-outbox-193229@kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>> +	local_irq_disable();
>> +	if (atomic_xchg(&ip30_power_off_claimed, 1))
>> +		for (;;)
>> +			cpu_relax();
>
> As reported by Sashiko on v1 [1], can another CPU still race on the
> indirect RTC index/data registers and bank selection while
> ds1685_rtc_poweroff() is running?

On dual-CPU Octanes the second CPU can still move the index or the
bank. v3 will stop the other CPU with smp_send_stop() before touching
HEART or the RTC.

>>  	ds1685_rtc_poweroff(to_platform_device(dev));
>
> Doesn't ds1685_rtc_poweroff() sleep in msleep(20) before cutting power,
> violating the atomic context established by local_irq_disable() and
> nbcon_cpu_emergency_enter()?

Not with the dependency named in the cover letter. Commit 21a829af60a7
("rtc: ds1685: do not sleep in the power-off handler"), in v7.4-rc1,
replaces that msleep() with mdelay().

>> +#ifdef CONFIG_SGI_IP30
>> +	.plat_prepare_poweroff = ip30_prepare_poweroff,
>> +#endif
>
> What happens on a power button press when CONFIG_SGI_IP30=y and
> CONFIG_RTC_DRV_DS1685_FAMILY=m?

The button stops cutting the power, as the built-in
ip30_machine_power_off() cannot reach the module. v3 will set the hook
only when rtc-ds1685 is built in, so a modular driver will power off
on a press as it did before this series, and the second-press branch
will return.


Thanks,
Imre
