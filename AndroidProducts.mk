PRODUCT_MAKEFILES := \
	$(LOCAL_DIR)/lineage_a10.mk

COMMON_LUNCH_CHOICES := \
    $(foreach variant, user userdebug eng, lineage_a10-$(variant))