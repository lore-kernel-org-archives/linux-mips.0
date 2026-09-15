Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439174A2609
	for <linux-mips@vger.kernel.org>; Tue, 15 Sep 2026 08:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789460899; cv=none; b=dUVWjqi6dnlN6x0GIWdO2yMPTmFs5lRRjx3/RcvwgNECjhXmzQ5mh+UbA9HTGbXwxQdYMgZ+XcX+/mDA8XvsSnui2/Zdr3Vhc0tW+tMVKySOFJbs+Xr1OxfEOfObeMgWjYVRVSrdi8U9rqXcEAiKd6UztXFdBfiCi1BPtiqX1CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789460899; c=relaxed/simple;
	bh=7ISDVBxGmgeCdxhmRRdB69cX7Bxvnv7xpoH47YwrzBI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gHEC43VAWmljuDAlBQ52kzh10fZGFeGeqPaTdeA1PKvd8OknK2y8CmUjgFPlcW/u1qpXUZpcTWi6Vz3yyGFMwk6AyMAulrvYxyscZFLK3MBjLPE2ifNhiiNdsNP3JzKr82rwzRP9gdr539eS4jk0tE8LBnYaDa3CbysOsjHI7KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=seSTCf37; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="seSTCf37"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfa4e4684bso97660315ad.2
        for <linux-mips@vger.kernel.org>; Tue, 15 Sep 2026 01:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789460897; x=1790065697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Yp7aMeBt5kbv9wDm9MP1w/VhRzf84I2dhiWVAxjsG5I=;
        b=seSTCf370tm7TwbwcE2sOqzbBgrmiG5hyBf6aHdgB2rKBucULc5RUL/7RURwxmV8KM
         4ZKXUiS3tAaFPYfskhpg9yIF/hTEX/NA8YcgjQE9x1KvAFd3vyUplrQmM8KUPBSXTOwg
         0yMjz5Cy2hUV/J8f8PH7KR7mJkTvBjuNJwUjsUarOD2dDtKZdxxgDxji9wigb9weRiLj
         AtYHCQoDel3tU2dXP39R71gxVibD+vsKyfvBt3J+FyKWY2jWR+H/hFyL6u5FE+Q2jctT
         F7sa8RDySUYCM8mhA2bBiG+ZfSF9alpOZu52giGG19prbFdO8mvj/aBzjzPQQt9oXoec
         ZLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789460897; x=1790065697;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yp7aMeBt5kbv9wDm9MP1w/VhRzf84I2dhiWVAxjsG5I=;
        b=FV9XkkHSi5cj48DZSs3dUubJg5PxEEWkM2N038toRWXMsMBBJAh9Z9mU5FIG7NBwKZ
         BIS/KW8m3CLnDpayiukNZRNjOiwZVxfipt7ZcX4kGMqR3Mz7X3B1oQF5I7besL4gxamZ
         ao0D6Kv2f5hGBdwggq7ryfwgzUQGReeRO2aCxGvgBhCW9B69TF7hK6fI/VSOZtHBDXyJ
         RJbdQDL9Lx8kyt+IBy9oVSi3yDcX15fLEopPCsQ7H+T76LiQXuRjSVxeeOPRKT1hqO03
         SmGjsLQGQJHik8sTZupKfaSHNw3KdJY7ltZppflIZxfmAmMD8B+1NTYhckjgzNWRTXwy
         z2rA==
X-Forwarded-Encrypted: i=1; AKwUvBxt7wHyg7ZdO4sSgsBcmuBfvHD2FOvwwXCLCcCRmoIG5TpPO0OKubtzmF2ER9FisCnRlotKPW+m0E99@vger.kernel.org
X-Gm-Message-State: AFuF++kEbd/ByRksul0dXCip6Cr7aarn73txy44Doz2eUI8oGa6afbR6
	RfkefTVikOSupfJoYiT/GtF+E3q2hNP8KJallsGO0oO617f5pMgkkmS0OtLpe+wKWVZK+CCEAN8
	b
X-Received: from pltt2.prod.google.com ([2002:a17:902:d142:b0:2dd:5303:f006])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f64f:b0:2dd:278c:5eb
 with SMTP id d9443c01a7336-2dd83851f4amr602125ad.14.1789460417430; Tue, 15
 Sep 2026 01:20:17 -0700 (PDT)
Date: Tue, 15 Sep 2026 08:18:43 +0000
In-Reply-To: <20260915081910.4142719-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260915081910.4142719-1-morbo@google.com>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
Message-ID: <20260915081910.4142719-27-morbo@google.com>
Subject: [PATCH 26/28] wifi: wil6210: Refactor resume_triggers2string() to use seq_buf
From: Bill Wendling <morbo@google.com>
To: linux-kernel@vger.kernel.org
Cc: Bill Wendling <morbo@google.com>, codemender-patching+linux@google.com, 
	Russell King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Ian Abbott <abbotti@mev.co.uk>, 
	H Hartley Sweeten <hsweeten@visionengravers.com>, Tony Luck <tony.luck@intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthew Brost <matthew.brost@intel.com>, 
	"=?UTF-8?q?Thomas=20Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Matthias Schwarzott <zzam@gentoo.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Arend van Spriel <arend.vanspriel@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, 
	Anil Gurumurthy <anil.gurumurthy@qlogic.com>, 
	Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>, "Martin K. Petersen" <mkp@kernel.org>, 
	Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
	Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, Kees Cook <kees@kernel.org>, 
	Jiri Pirko <jiri@resnulli.us>, Simon Horman <horms@kernel.org>, Chuck Lever <cel@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>, 
	Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Kanglong Wang <wangkanglong@loongson.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Qiang Ma <maqianga@uniontech.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Pengpeng Hou <pengpeng@iscas.ac.cn>, Ard Biesheuvel <ardb@kernel.org>, Breno Leitao <leitao@debian.org>, 
	Thorsten Blum <blum@kernel.org>, Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lyude Paul <lyude@redhat.com>, 
	Ashutosh Desai <ashutoshdesai993@gmail.com>, Imre Deak <imre.deak@intel.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Johan Hovold <johan@kernel.org>, 
	Johannes Berg <johannes.berg@intel.com>, 
	Miri Korenblit <miriam.rachel.korenblit@intel.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Cryolitia PukNgae <cryolitia@uniontech.com>, Jiaming Zhang <r772577952@gmail.com>, 
	Will Porter <mrwillporter@gmail.com>, Cen Zhang <zzzccc427@gmail.com>, 
	"=?UTF-8?q?C=C3=A1ssio=20Gabriel?=" <cassiogabrielcontato@gmail.com>, Rong Zhang <i@rong.moe>, 
	Arun Raghavan <arunr@valvesoftware.com>, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-edac@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-input@vger.kernel.org, linux-media@vger.kernel.org, 
	intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com, devicetree@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-nfs@vger.kernel.org, 
	devel@lists.orangefs.org, linux-hardening@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

resume_triggers2string() builds a space-separated string of active resume
trigger names using a series of conditional strlcat() calls.

In preparation for removing the deprecated strlcat() API[1], replace the
strlcat() calls with struct seq_buf and seq_buf_puts().

Link: https://github.com/KSPP/linux/issues/370 [1]
Cc: codemender-patching+linux@google.com
Assisted-by: CoPilot:1.0 [editor_update_file, make_kernel_build_single_file=
]
Signed-off-by: Bill Wendling <morbo@google.com>
---
Cc: Russell King <linux@armlinux.org.uk>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ian Abbott <abbotti@mev.co.uk>
Cc: H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: Tony Luck <tony.luck@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: "Thomas Hellstr=C3=B6m" <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthias Schwarzott <zzam@gentoo.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>
Cc: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Anil Gurumurthy <anil.gurumurthy@qlogic.com>
Cc: Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>
Cc: "Martin K. Petersen" <mkp@kernel.org>
Cc: Trond Myklebust <trondmy@kernel.org>
Cc: Anna Schumaker <anna@kernel.org>
Cc: Mike Marshall <hubcap@omnibond.com>
Cc: Martin Brandenburg <martin@omnibond.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Jiri Pirko <jiri@resnulli.us>
Cc: Simon Horman <horms@kernel.org>
Cc: Chuck Lever <cel@kernel.org>
Cc: Jeff Layton <jlayton@kernel.org>
Cc: NeilBrown <neil@brown.name>
Cc: Olga Kornievskaia <okorniev@redhat.com>
Cc: Dai Ngo <Dai.Ngo@oracle.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Bill Wendling <morbo@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Kanglong Wang <wangkanglong@loongson.cn>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Qiang Ma <maqianga@uniontech.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Breno Leitao <leitao@debian.org>
Cc: Thorsten Blum <blum@kernel.org>
Cc: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Ashutosh Desai <ashutoshdesai993@gmail.com>
Cc: Imre Deak <imre.deak@intel.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Johan Hovold <johan@kernel.org>
Cc: Johannes Berg <johannes.berg@intel.com>
Cc: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Cryolitia PukNgae <cryolitia@uniontech.com>
Cc: Jiaming Zhang <r772577952@gmail.com>
Cc: Will Porter <mrwillporter@gmail.com>
Cc: Cen Zhang <zzzccc427@gmail.com>
Cc: "C=C3=A1ssio Gabriel" <cassiogabrielcontato@gmail.com>
Cc: Rong Zhang <i@rong.moe>
Cc: Arun Raghavan <arunr@valvesoftware.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: loongarch@lists.linux.dev
Cc: linux-mips@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Cc: linux-edac@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: linux-input@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: intel-wired-lan@lists.osuosl.org
Cc: netdev@vger.kernel.org
Cc: linux-wireless@vger.kernel.org
Cc: brcm80211@lists.linux.dev
Cc: brcm80211-dev-list.pdl@broadcom.com
Cc: devicetree@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-scsi@vger.kernel.org
Cc: linux-nfs@vger.kernel.org
Cc: devel@lists.orangefs.org
Cc: linux-hardening@vger.kernel.org
Cc: linux-sound@vger.kernel.org
---
 drivers/net/wireless/ath/wil6210/wmi.c | 38 ++++++++++++++------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/ath/wil6210/wmi.c b/drivers/net/wireless/=
ath/wil6210/wmi.c
index 479b2418ca34..fcc9e9eb5732 100644
--- a/drivers/net/wireless/ath/wil6210/wmi.c
+++ b/drivers/net/wireless/ath/wil6210/wmi.c
@@ -7,6 +7,7 @@
 #include <linux/moduleparam.h>
 #include <linux/etherdevice.h>
 #include <linux/if_arp.h>
+#include <linux/seq_buf.h>
=20
 #include "wil6210.h"
 #include "txrx.h"
@@ -3162,27 +3163,30 @@ int wmi_suspend(struct wil6210_priv *wil)
=20
 static void resume_triggers2string(u32 triggers, char *string, int str_siz=
e)
 {
-	string[0] =3D '\0';
+	struct seq_buf s;
+
+	seq_buf_init(&s, string, str_size);
=20
 	if (!triggers) {
-		strlcat(string, " UNKNOWN", str_size);
-		return;
+		seq_buf_puts(&s, " UNKNOWN");
+	} else {
+		if (triggers & WMI_RESUME_TRIGGER_HOST)
+			seq_buf_puts(&s, " HOST");
+
+		if (triggers & WMI_RESUME_TRIGGER_UCAST_RX)
+			seq_buf_puts(&s, " UCAST_RX");
+
+		if (triggers & WMI_RESUME_TRIGGER_BCAST_RX)
+			seq_buf_puts(&s, " BCAST_RX");
+
+		if (triggers & WMI_RESUME_TRIGGER_WMI_EVT)
+			seq_buf_puts(&s, " WMI_EVT");
+
+		if (triggers & WMI_RESUME_TRIGGER_DISCONNECT)
+			seq_buf_puts(&s, " DISCONNECT");
 	}
=20
-	if (triggers & WMI_RESUME_TRIGGER_HOST)
-		strlcat(string, " HOST", str_size);
-
-	if (triggers & WMI_RESUME_TRIGGER_UCAST_RX)
-		strlcat(string, " UCAST_RX", str_size);
-
-	if (triggers & WMI_RESUME_TRIGGER_BCAST_RX)
-		strlcat(string, " BCAST_RX", str_size);
-
-	if (triggers & WMI_RESUME_TRIGGER_WMI_EVT)
-		strlcat(string, " WMI_EVT", str_size);
-
-	if (triggers & WMI_RESUME_TRIGGER_DISCONNECT)
-		strlcat(string, " DISCONNECT", str_size);
+	seq_buf_str(&s);
 }
=20
 int wmi_resume(struct wil6210_priv *wil)
--=20
2.55.0.1032.g73a4cd73de-goog

