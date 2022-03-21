from rest_framework.routers import SimpleRouter
from .views import FileViewset


router = SimpleRouter()
router.register('files', FileViewset)
urlpatterns = router.urls
