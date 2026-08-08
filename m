Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B160B3446C5
	for <linux-mips@vger.kernel.org>; Sat,  8 Aug 2026 15:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.160
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786203938; cv=pass; b=QPA4B42PcC0N8P1MM6/Dfmj4pVPgslwFSMGknYhO1CwvEetZV7nXMBH8ICpv0rl8Ya2qmBOjXeEX/K641rl8wKJQGb/Nx1Yyu/kVSuy4UeFC+/T2lIiuY9U8px2XFNsKp0zLGKRqZPu4e+RBFp1gUsxE3Xazh4Uad51QQnaQQx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786203938; c=relaxed/simple;
	bh=E8ShNNt8P0DlG5EzPrPk6BhqZnsIaukhTdHQbSYNS/M=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=M54uwxrehvACMWXBvfxaV3uI2esySAmxhASff6JudbKMCj+EKgz5M7xkSUVOVOs6i+aMHYpzjSeWlHMhiqa/9iJB2975uoJyqTntqCTgvA46w4msjFZLM6StELh1mtcl6/fuF6p/VvfNXcrWkZ2wmedKp9u+W7PBW8xVO+8bMqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=YaQDI1dL; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=/yGtGsqE; arc=pass smtp.client-ip=81.169.146.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="YaQDI1dL";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="/yGtGsqE"
ARC-Seal: i=1; a=rsa-sha256; t=1786203918; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=enkUA/kENiij4aj/FVFY1+qohk13hOpUBfGfg9DinM5v1ZJSwjgOkcwuRYAcLs6dKF
    cv2sumnwKch0iqcub+mD+FTGvMKzIs5O8xG7zziC8c9eJk9y+AirjFjRZFQn1nYc3pB5
    /gQNJDvzRfsFZjRK2gwDRzrC+m3mOE7Zxzcmy5y18zS0GrAIpiGzS7hfRVWzff3mDR6b
    o7EOhcOin8qAl3S+Qb2/h+GZA2/7T2IFSEo6Uk2r5sIZTtcYJqr6wLvTNftUD3DnjGwL
    qQ85SZkgIyN6MvzOj56Rroud4gZQaIB1d89lsk3oIhfuS0WtWTAEzOMvVMlPkDMtBB+l
    ToWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1786203918;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=4CkmuvvjVruI1XWCVER8h111FaAo99HGRQ6xjWYwUSI=;
    b=BqbR9htgu06VXL8Q3x7oqex8N3g0uVTYVM6N75PbZkCTMfZolwWVMMoRfjgDBooy1R
    QIFdW5TEYGGDFn1O1s+ieOIIxdhHf2XKE7whdPz4rJl0MP0IUjTYlHkyPZDk+CO/yWzg
    JloznzD9m+zH6kgUN18HxgLY29pH9zvBDe5qoJ4msXprKntbLI8/1qDy7sgUKWoaXhpY
    pBuxLu+tPaV6iYs0GTxP+UUGBIQ/0zK4iDi+RaVBFZaLi2Z7tHUwg8ekl5V1W+XDsRpP
    RfWSGFZegDa2qH5OUyDKHmmPRN0FHZvX0Yo9eEbj0q7OoKZnQ5U/rPhwXX6/LgWFZiVQ
    mTcA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1786203918;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=4CkmuvvjVruI1XWCVER8h111FaAo99HGRQ6xjWYwUSI=;
    b=YaQDI1dL4tyMuTzKpM4lzUqGX4uly8k/A9wG2PIQkRDddZ5B9+e29bCxowcTLCfPXr
    TmQjkiS6j8/QjdiIXBJ5x1CBV2sD2GigAV9a9skDJfXEhQboXihbzoE/H6QKPdDMVxzO
    +GBpW7by0Jl2AiZULqY5HFH7DdcsXn7Gh+WrNTpma+lcsZqMVMljf6N+xQfndsOh0zWc
    2ik7NVg1bsvNmDOISgH0cE7xmTcdWCvMxIOzlg1IClIZBimMvIHU35hJyPZ8jugQm9Nl
    2lMC6FUJREkZH6ZFp7EZHmKxQ/kUe/ScXlatvBHBUumgO3j/8TS1oAazQZXGWLjip3bk
    Ir+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1786203918;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=4CkmuvvjVruI1XWCVER8h111FaAo99HGRQ6xjWYwUSI=;
    b=/yGtGsqEl2pNVbPCkxkn0g0T+al/2ZazP15D4OGkZnpjL8Or7zV8biWKtWDpy2aqk7
    RRjQxrot+3ZKQSuVrSAw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yeDgZ"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.5.6 DYNA|AUTH)
    with ESMTPSA id Q58eac278FjIbOq
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Sat, 8 Aug 2026 17:45:18 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: imgtec ci20 HDMI broken
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <ancr4X9BNc3S0sC3@waldemar-brodkorb.de>
Date: Sat, 8 Aug 2026 17:45:07 +0200
Cc: linux-mips@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <0DFD48CB-3CA5-46EC-9501-72C68A1F9157@goldelico.com>
References: <ancr4X9BNc3S0sC3@waldemar-brodkorb.de>
To: Waldemar Brodkorb <wbx@openadk.org>
X-Mailer: Apple Mail (2.3864.700.51.1.1)

Hi Waldemar,

> Am 08.08.2026 um 15:15 schrieb Waldemar Brodkorb <wbx@openadk.org>:
>=20
> Hi,
>=20
> I recently played a little bit with ci20 devices.
> It seems HDMI is broken in Linux 7.1.6.
>=20
> Here is the kernel oops captured via serial console:
>=20
> [   54.997593] dw-hdmi-ingenic 10180000.hdmi: Detected HDMI \X =
controller v1.31a with HDCP (DWC HDMI 3D TX PHY)
> [   55.491338] dw-hdmi-ingenic 10180000.hdmi: registered DesignWare =
HDMI I2C bus driver
> [   55.899132] [drm] DRM bridge corrupted or not allocated by =
devm_drm_bridge_alloc()
> [   55.904136] ------------[ cut here ]------------
> [   55.908753] WARNING: lib/refcount.c:25 at drm_bridge_get+0x58/0x6c =
[drm], CPU#0: kworker/u4:2/36
> [   55.917538] refcount_t: addition on 0; use-after-free.
> [   55.922553] Modules linked in: ingenic_dw_hdmi ingenic_drm hci_uart =
dw_hdmi v4l2_fwnode drm_dma_helper drm_display_helper drm_client_lib =
display_connector btbcm b
> rcmfmac_cyw brcmfmac_wcc brcmfmac_bca v4l2_async msi001 fc2580 e4000 =
drm_kms_helper brcmfmac bluetooth au8522_decoder xc5000 xc4000 xc2028 =
videodev tuner_simple tda1
> 0071 tda1004x tda10048 stv0299 sp887x sp2 si2165 si2157 rc_zx_irdec =
rc_xbox_dvd rc_xbox_360 rc_x96max rc_winfast_usbii_deluxe rc_winfast =
rc_wetek_play2 rc_wetek_hub=20
> rc_videostrong_kii_pro rc_videomate_tv_pvr rc_videomate_s350 =
rc_videomate_m1f rc_vega_s9x rc_twinhan1027 rc_twinhan_dtv_cab_ci =
rc_tt_1500 rc_trekstor rc_total_media_
> in_hend_02 rc_total_media_in_hand rc_tivo rc_tevii_nec =
rc_terratec_slim_2 rc_terratec_slim rc_terratec_cinergy_xs =
rc_terratec_cinergy_s2_hd rc_terratec_cinergy_c_pci
> rc_technisat_usb2 rc_technisat_ts35 rc_tbs_nec rc_tanix_tx5max =
rc_tanix_tx3mini rc_su3000 rc_streamzap rc_snapstream_firefly =
rc_siemens_gigaset_rc20 rc_reddo rc_rea
> l_audio_220_32_keys rc_rc6_mce rc_pv951
> [   55.923042]  rc_purpletv rc_proteus_2309 rc_powercolor_real_angel =
rc_pixelview_new rc_pixelview_mk12 rc_pixelview_002t rc_pixelview =
rc_pinnacle_pctv_hd rc_pinnacle_grey rc_pinnacle_color rc_pine64 =
rc_pctv_sedna rc_odroid rc_npgtech rc_norwood rc_nec_terratec_cinergy_xs =
rc_nebula rc_mygica_utv3 rc_msi_tvanywhere_plus rc_msi_tvanywhere =
rc_msi_digivox_iii rc_msi_digivox_ii rc_minix_neo rc_medion_x10_or2x =
rc_medion_x10_digitainer rc_medion_x10 rc_mecool_kiii_pro =
rc_mecool_kii_pro rc_manli rc_lme2510 rc_leadtek_y04g0051 =
rc_kworld_plus_tv_analog rc_kworld_pc150u rc_kworld_315u rc_khamsin =
rc_khadas rc_kaiomy rc_it913x_v2 rc_it913x_v1 rc_iodata_bctv7e =
rc_imon_rsc rc_imon_pad rc_imon_mce rc_hisi_tv_demo rc_hisi_poplar =
rc_hauppauge rc_gotview7135 rc_genius_tvgo_a11mce rc_geekbox =
rc_gadmei_rm008z rc_fusionhdtv_mce rc_flyvideo rc_flydvb rc_eztv =
rc_evga_indtube rc_encore_enltv2 rc_encore_enltv_fm53 rc_encore_enltv =
rc_em_terratec rc_dvico_portable rc_dvico_mce rc_dvbsky rc_dtt200u =
rc_dreambox rc_dntv_live_dvbt_pro
> [   56.012798]  rc_dntv_live_dvb_t rc_dm1105_nec rc_digittrade =
rc_digitalnow_tinytwin rc_dib0700_rc5 rc_dib0700_nec rc_delock_61959 =
rc_d680_dmb rc_ct_90405 rc_cinergy_1400 rc_cinergy rc_budget_ci_old =
rc_behold_columbus rc_behold rc_beelink_mxiii rc_beelink_gs1 =
rc_azurewave_ad_tu700 rc_avertv_303 rc_avermedia_rm_ks =
rc_avermedia_m733a_rm_k6 rc_avermedia_m135a rc_avermedia_dvbt =
rc_avermedia_cardbus rc_avermedia_a16d rc_avermedia rc_ati_x10 =
rc_ati_tv_wonder_hd_600 rc_asus_ps3_100 rc_asus_pc39 =
rc_astrometa_t2hybrid rc_apac_viewcomp rc_anysee rc_alink_dtu_m =
rc_adstech_dvb_t_pci or51211 or51132 nxt200x mxl692 mn88473 mn88472 =
lgs8gxx ir_kbd_i2c ingenic_rng gpio_ir_tx gpio_ir_recv ecdh_generic =
ds3000 drxk drxd drx39xyj drm dib9000 dib8000 dib7000p dib7000m =
dib3000mc cxd2880_spi cx24120 cx24117 cx24116 cfg80211 bcm3510 =
au8522_dig zl10353 zl10039 zl10036 zd1301_demod ves1x93 ves1820 =
v4l2_dv_timings tuner_types tua9001 tua6100 ts2020 tea5767 tea5761 =
tda9887 tda8290 tda827x tda826x tda8261 tda8083 tda665x tda18271c2dd =
tda18271
> [   56.101318]  tda18250 tda18218 tda18212 tda10086 tda10023 tda10021 =
tc90522 stv6111 stv6110x stv6110 stv0910 stv090x stv0900 stv0367 stv0297 =
stv0288 stb6100 stb6000 stb0899 si21xx sha256 s921 s5h1432 s5h1420 =
s5h1411 s5h1409 rng_core rc_core r820t qt1010 qm1d1c0042 qm1d1b0004 =
pwm_jz4740 nxt6000 mxl5xx mxl5007t mxl5005s mxl301rf mt352 mt312 mt2266 =
mt2131 mt20xx mt2063 mt2060 mn88443x mc44s803 mc mb86a20s mb86a16 =
max2165 m88rs6000t m88rs2000 lnbp22 lnbp21 lnbh29 lnbh25 libaes lgs8gl5 =
lgdt330x lgdt3305 lg2160 ledtrig_camera ledtrig_backlight l64781 kpp =
ix2505v itd1000 it913x isl6423 isl6421 isl6405 horus3a helene gpio_keys =
firmware_class fc0013 fc0012 fc0011 ecc ec100 dvb_pll dvb_core =
drm_panel_orientation_quirks dibx000_common dib3000mb dib0090 dib0070 =
cxd2880 cxd2841er cxd2820r cxd2099 cx24123 cx24113 cx24110 cx22702 =
cx22700 cmac cec brcmutil au8522_common atbm8830 ascot2e af9033 a8293
> [   56.268085] CPU: 0 UID: 0 PID: 36 Comm: kworker/u4:2 Not tainted =
7.1.6-1 #1 PREEMPT
> [   56.275401] Hardware name: img,ci20
> [   56.278840] Workqueue: events_unbound deferred_probe_work_func
> [   56.284648] Stack : 00000000 8017d63c 83fa5a4c 00000004 00000000 =
00000000 00000000 00000000
> [   56.292995]         00000000 00000000 00000000 00000000 00000000 =
00000001 83fa5a00 de998ae0
> [   56.301315]         83fa5a98 00000000 00000000 00000000 00000038 =
807c2d44 00000000 00000000
> [   56.309634]         00000000 00000078 808725a0 6e756f62 00000000 =
80aa0000 00000000 809fa27c
> [   56.317955]         00000000 80a15b38 83fa5b3c c0488b60 00000000 =
804f783c 00edc85f 00edc89f
> [   56.326275]         ...
> [   56.328669] Call Trace:
> [   56.331094] [<80115ee4>] show_stack+0xb4/0x15c
> [   56.335521] [<8010e460>] dump_stack_lvl+0x4c/0x7c
> [   56.340200] [<8012a5b8>] __warn+0xb8/0x110
> [   56.344272] [<8012a6cc>] warn_slowpath_fmt+0xbc/0x14c
> [   56.349389] [<c0488b60>] drm_bridge_get+0x58/0x6c [drm]
> [   56.354928] [<c04898b8>] drm_bridge_attach+0x80/0x208 [drm]
> [  !56.360397] [<c08ff740>] ingenic_drm_bind.constprop.0+0x68c/0xa18 =
[ingenic_drm]
> [   56.367362] [<8055f148?] platform_probe+0x50/0x8c
> [   56.372007] [<8055ccc8>] really_probe+0x164/0x2c4
> [   56.376687] [<8055d0f0>] driver_probe_device+0x40/0xcc
> [   56.381801] [<8055d1d8>] __device_attach_driver+0x5c/0xdc
> [   56.387174] [<8055abb4>] bus_for_each_drv+0xc8/0xf0
> [   56.392027] [<8055cb08>] __device_attach+0xe8/0x13c
> [   56.396880] [<8055d4e4>] device_initial_probe+0x40/0x6c
> [   56.402080] [<8055b7c8>] bus_probe_device+0x34/0xbc
> [   56.406933] [<8055c62c>] deferred_probe_work_func+0xb0/0xc8
> [   56.412482] [<801448b0>] process_scheduled_works+0x228/0x304
> [   56.418114] [<80144be0>] worker_thread+0x254/0x2c4
> [   56.422880] [<8014d798>] kthread+0x150/0x158
> [   56.427125] [<801108ec>] ret_from_kernel_thread+0x14/0x1c
> [   56.432501]
> [   56.434018] ---[ end trace 0000000000000000 ]---
>=20
> Does anyone know how to fix it?
>=20
> best regards
> Waldemar
>=20

I am not sure if I did see the same error but I recently did a fix for =
bridge allocation (not submitted):

=
https://github.com/goldelico/letux-kernel/commit/9d039bd064094b176825da9f4=
71e9c4447674703

Please let me know if it works. Then we can post it.

Best regards,
Nikolaus



